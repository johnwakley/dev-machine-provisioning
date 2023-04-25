#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2016,SC2093
set -o errexit -o errtrace -o nounset -o pipefail

set -a # POSIX compatible
source .env
set +a

# Set up zsh
sudo dnf install zsh
sudo dnf install util-linux-user
#
# May need to restart after chsh, otherwise use lchsh: https://www.reddit.com/r/Fedora/comments/tkph8x/i_cannot_switch_shell_to_zsh_or_anyother/
#
chsh -s "$(which zsh)"

# Python
./install-python-linux.sh

# Ansible
sudo pip install ansible
ansible-galaxy collection install community.general
