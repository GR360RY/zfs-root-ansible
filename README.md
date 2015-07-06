zfs-root-ansible
================

Automated Ubuntu 14.04 installation on zfs root filesystem. This setup assumes that you have a clean drive for zfs installation. 

zfs installation will be performed on full disk ( without additional ext4 partition for /boot ). Currently installation is supported only on single drive but will be extended in the future to support multiple drive for native zfs root.

Ansible automation is based on the zfs-pkg Wiki Guide:
https://github.com/zfsonlinux/pkg-zfs/wiki/HOWTO-install-Ubuntu-14.04-or-Later-to-a-Native-ZFS-Root-Filesystem


## System Requirements

* 64-bit Ubuntu LiveCD or USB Flash Drive with Ubuntu Installer ( Will be refered to as LiveCD ).
* 8GB USB stick ( Will be refered to as ZRU - ZFS Recue USB ).
* x86_64 compatible PC.
* HDD/SSD Drive for root file system.
* 2GB memory minimum ( 4GB Recommended ).

## Installation

### Step 1: Preparing The Install Environment

1. Boot into Ubuntu LiveCD
2. Perform Ubuntu Installation on ZRU ( Make sure GRUB is installed on USB Flash Drive ).
3. Power off you PC and remove LiveCD Installation Media.

> WARNING: Make sure to boot your System using MBR and not EFI Boot

4. Boot from ZRU. 
5. Login and open terminal.


### Step 2: Installing Prerequisites

Configure Ansible PPA:

    sudo apt-get -y install software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update

Install Ansible, git and lsscsi packages:

    sudo apt-get -y install ansible git lsscsi 

Clone zfs-root-ansible repository:

    cd ~
    git clone https://github.com/GR360RY/zfs-root-ansible.git
    cd zfs-root-ansible

Exemine your storage device list:

    lsscsi

(Example output is below): 
    
    [0:0:0:0]    disk    ATA      WDC WD2002FYPS-0 04.0  /dev/sda
    [1:0:0:0]    disk    ATA      WDC WD2002FYPS-0 04.0  /dev/sdb
    [2:0:0:0]    disk    ATA      WDC WD2002FYPS-0 04.0  /dev/sdd
    [3:0:0:0]    disk    ATA      WDC WD2002FYPS-0 04.0  /dev/sde
    [4:0:0:0]    disk    ATA      WDC WD2002FYPS-0 04.0  /dev/sdf
    [5:0:0:0]    disk    ATA      OCZ-AGILITY3     2.15  /dev/sdg

Note the drive device that you will perform installation on ( ex: /dev/sdg )

Open zfsroot.yml in your favorit editor and modify `root_drive` variable if required.

### Step 3: Running Ansible Playbook


    ansible-playbook -c local -K -i "localhost," zfsroot.yml

### Step 4: Changing boot order

* Reboot you pc following ansible-playbook run.
* Change default boot device in BIOS to new HD with zfs root file system.

## Development and Testing with Vagrant

If you want to test out the configuration in VirtualMachine, install requirements and follow the below guide:

### Requirements

* Install [Vagrant](http://www.vagrantup.com/)
* Install [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Ansible](http://docs.ansible.com/intro_installation.html)

###  Testing

Clone zfs-root-ansible repository:

    cd ~
    git clone https://github.com/GR360RY/zfs-root-ansible.git
    cd zfs-root-ansible

Run vagrant:

    vagrant up

Reboot your vagrant box following the provisioning:

    vagrant reload

* Focus on VirtualBox Screen and Press __(F12)__.
* Press __2__ to boot with newly deployed zfs drive. 


License
-------

BSD

