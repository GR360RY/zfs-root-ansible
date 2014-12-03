zfs-root-ansible
================

Automated Ubuntu 14.04 installation on zfs root filesystem. 


### System Requirements

* 64-bit Ubuntu LiveCD or USB Flash Drive with Ubuntu Installer ( Will be refered to as LiveCD ).
* 8GB USB stick ( Will be refered to as ZRU - ZFS Recue USB ).
* x86_64 compatible PC.
* HDD/SSD Drive for root file system.
* 2GB memory minimum ( 4GB Recommended ).


### Step 1: Preparing The Install Environment

1. Boot into Ubuntu LiveCD
2. Perform Ubuntu Installation on ZRU ( Make sure GRUB is installed on USB Flash Drive ).
3. Power off you PC and remove LiveCD Installation Media.
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

Open zfs-root.yml in your favorit editor and modify `root_drive` variable if required.

### Step 3: Running Ansible Playbook


    ansible-playbook -c local -K -i "localhost," zfs-root.yml

Reboot you pc following installation completion.

License
-------

BSD

