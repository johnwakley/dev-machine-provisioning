#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2016,SC2093
set -o errexit -o errtrace -o nounset -o pipefail

set -a # POSIX compatible
source .env
set +a

# Xcode developer tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Python
./install-python-mac.sh

# Ansible
sudo pip install ansible
ansible-galaxy collection install community.general