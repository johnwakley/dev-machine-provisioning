#!/usr/bin/env bash
# shellcheck disable=SC1091
set -o errexit -o errtrace -o nounset -o pipefail

# credit: https://gist.github.com/berkayunal/ccb1c3511f02d41b7654de17bced30b7
# Load all variables from .env and export them all for Ansible to read
set -a # POSIX compatible
source ../.env
source ../.env.linux
set +a

# Run Ansible
exec ansible-playbook "$@"