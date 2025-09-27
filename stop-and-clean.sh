#!/usr/bin/env bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

pushd "$script_dir/sentry" || exit
docker compose down -v
docker volume ls -q | grep sentry | xargs -I{} docker volume rm {}
popd || exit
pushd "$script_dir" || exit
docker compose down -v