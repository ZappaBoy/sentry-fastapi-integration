# Sentry and FastAPI integration

## Create `.env`
```shell
ENVIRONMENT=development
PORT=3000
LOG_LEVEL=debug
ALLOWED_HOSTS=localhost,otherlocalhost
```

## Deploy Sentry

Run the `start-sentry.sh` script to deploy Sentry using official Docker Compose configuration:
```shell
./start-sentry.sh
```

During the first run, you'll be prompted to create an admin account. You can use this account to access the Sentry web
interface.

If you want to create a new user, run:
```shell
docker compose run --rm web createuser
```

## Configure Sentry DSN

After deploying Sentry, you need to configure the DSN (Data Source Name) for your FastAPI application. You can find the
DSN in the Sentry web interface under your project settings or creating a new one.
Remember that Sentry has a lot of integrations and one of these is Fastapi.
After the project creation, copy the DSN URL, and add it to your `.env` file:

```shell
# .env
...
SENTRY_DSN=http://your_dsn@your_sentry_server/your_project_id
...
```

NOTE: if you want to test the application with docker compose, you need to replace `localhost:9000` with
`sentry.local:9000` in the DSN URL.
Then, the docker compose configuration will map the `sentry.local` to the Sentry container.

## Install dependencies and run FastAPI app

Make sure you have the required dependencies installed. You can use pip to install them:

```shell
pip install -r requirements.txt
```

Run your FastAPI application:

```shell
uvicorn main:app --reload --host
```

