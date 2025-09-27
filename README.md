# Sentry and FastAPI integration

## Create `.env`
```shell
ENVIRONMENT=development
PORT=3000
LOG_LEVEL=debug
ALLOWED_HOSTS=localhost,otherlocalhost
```

## Deploy Sentry

```shell
VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/getsentry/self-hosted/releases/latest)
VERSION=${VERSION##*/}
git clone https://github.com/getsentry/self-hosted.git
cd self-hosted
git checkout ${VERSION}

# During the installation an accout will be created for you.
./install.sh
# After installation, run the following to start Sentry:
docker compose up --wait
```

If you want to create a new user, run:

```shell
docker compose run --rm web createuser
```