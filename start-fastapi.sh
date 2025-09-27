#!/usr/bin/env bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
pushd "$script_dir" || exit

echo "Starting FastAPI app..."
docker compose up --wait --build -d