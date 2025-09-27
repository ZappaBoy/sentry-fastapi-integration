#!/usr/bin/env bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
sentry_start_script="$script_dir/start-sentry.sh"
fastapi_start_script="$script_dir/start-fastapi.sh"

bash "$sentry_start_script"

cat <<EOF
Sentry is now running. Access it at http://localhost:9000 and follow these steps to connect your FastAPI app:
1. Login using the account you created during installation.
2. Create a new FastAPI project in Sentry.
3. Get the DSN for the project (found in project settings).
4. Add the DSN to the .env file in the FastAPI project directory.
6. Remember to replace "localhost:9000" with "sentry.local:9000".
5. Click any button to continue and starting the FastAPI app...
EOF

read -r -n 1 -s
bash "$fastapi_start_script"

cat <<EOF
FastAPI app is now running. Access it at http://localhost:5000
You can test the API at http://localhost:5000/docs
Try to generate en error with "curl -X GET http://localhost:5000/api/sentry-debug"
Check Sentry dashboard to see the error logged.
Enjoy by ZappaBoy!
EOF