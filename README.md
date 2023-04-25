# dev-machine-provisioning
Mac and Linux (Fedora) dev machine provisioning with Ansible.

## Setup
1. Install Python and Ansible
```
./bootstrap-mac.sh
```

2. Run desired playbook roles by tag, e.g.
```
./ansible-playbook-mac.sh dev-mac.yml --ask-become-pass -i local -t nodejs
```

1. Install Python and Ansible
```
./bootstrap-linux.sh
```

2. Run desired playbook roles by tag, e.g.
```
./ansible-playbook-linux.sh dev-linux.yml --ask-become-pass -i local -t nodejs
```