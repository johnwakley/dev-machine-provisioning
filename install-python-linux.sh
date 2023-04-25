#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2016,SC2093
set -o errexit -o errtrace -o nounset -o pipefail

set -a # POSIX compatible
source .env
set +a

# Do this prior to pyenv install.
# Realtes to this issue: https://github.com/pyenv/pyenv/issues/678
# On fedora, install sqlite-devel instead of the mentioned libsqlite3-dev 
# https://fedora.pkgs.org/36/fedora-x86_64/sqlite-devel-3.36.0-5.fc36.i686.rpm.html
sudo dnf install sqlite-devel

# Install pyenv (https://github.com/pyenv/pyenv-installer)
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | sh

# Restart shell
exec "$SHELL"

# Install python version
pyenv install "${PYTHON_VERSION}"

#
# On fedora, pyenv install may fail with: https://github.com/pyenv/pyenv/issues/1889
# solution (above link, and https://tecadmin.net/how-to-install-python-3-10-on-centos-rhel-8-fedora/):
#
# sudo dnf install clang wget yum-utils make gcc openssl-devel bzip2-devel libffi-devel zlib-devel 
# CC=clang pyenv install "${PYTHON_VERSION}"
#

pyenv global "${PYTHON_VERSION}"

pip install --upgrade pip
