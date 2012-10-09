zfs-root-ansible
================

Ansible playbook to install zfs as root fs on Ubuntu 12.04 64 Bit

### System Requirements
( from
https://github.com/dajhorn/pkg-zfs/wiki/HOWTO-install-Ubuntu-to-a-Native-ZFS-Root-Filesystem
)

  * 64-bit Ubuntu Live CD.  (*not* the alternate installer)
  * AMD64 compatible computer. (ie: x86_64)
  * 8GB disk storage available.
  * 2GB memory minimum.


## Step 1: Prepare The Install Environment

  1.1 Start the Ubuntu LiveCD and open a terminal at the desktop.

  1.2 Input these commands at the terminal prompt:

    wget --no-check-certificate https://github.com/GR360RY/zfs-root-ansible/raw/master/tools/install.sh -O - | sh
