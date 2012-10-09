echo "\n\033[0;32m >> Install git and Ansible requirements\033[0m"
/usr/bin/apt-get -y install git python-paramiko python-yaml python-jinja2
echo "\n\033[0;32m >> Clone Ansible and deploy\033[0m"
git clone git://github.com/ansible/ansible.git
cd ./ansible
. ./hacking/env-setup
echo "127.0.0.1" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
echo "\n\033[0;32m >> Generate ssh-key for ansible passwordless access\033[0m"
/usr/bin/ssh-keygen -t rsa -N "" -f /root/.ssh/ansible_rsa
cat ~/.ssh/ansible_rsa.pub > ~/.ssh/authorized_keys
echo "\n\033[0;32m >> Run ZFS Installation Playbook\033[0m"
ansible all -m ping --private-key=/root/.ssh/ansible_rsa
