#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2016,SC2093
set -o errexit -o errtrace -o nounset -o pipefail

set -a # POSIX compatible
source .env
set +a

# Python
brew update && brew install pyenv && brew upgrade pyenv
pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"

# Restart shell
exec "$SHELL"

pip install --upgrade pip
