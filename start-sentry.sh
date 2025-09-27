#!/usr/bin/env bash

# Source: https://develop.sentry.dev/self-hosted/#getting-started

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

version=$(curl -Ls -o /dev/null -w "%{url_effective}" https://github.com/getsentry/self-hosted/releases/latest)
version=${version##*/}
pushd "$script_dir" || exit
git clone https://github.com/getsentry/self-hosted.git --depth 1 --branch "${version}" sentry
pushd sentry || exit
# During the installation an account will be created for you.
./install.sh
docker compose up --wait -d
popd || exit
