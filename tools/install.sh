echo "\n\033[0;32m >> Install git and Ansible requirements\033[0m"
/usr/bin/apt-get -y install git python-paramiko python-yaml python-jinja2 ssh
echo "\n\033[0;32m >> Clone Ansible\033[0m"
git clone git://github.com/ansible/ansible.git
echo "\n\033[0;32m >> Setup Ansible\033[0m"
cd ./ansible
. ./hacking/env-setup
echo "127.0.0.1" > ~/ansible_hosts
echo "\n\033[0;32m >> Clone zfs-root-ansible\033[0m]]"
git clone git://github.com/GR360RY/zfs-root-ansible.git
echo "\n\033[0;32m >> Run ZFS Installation Playbook\033[0m"
ansible-playbook zfs-root-ansible/zfs-root.yml
