# -*- mode: ruby -*-
# vi: set ft=ruby :

zpool_disk='./zpool_disk.vmdk' 

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # Create zpool disk if the file doesn't exist
    unless File.exist?(zpool_disk)
      vb.customize ['createhd', '--filename', zpool_disk, '--format', 'vmdk', '--size', 20 * 1024]
    end
    # Attach zpool disk
    vb.customize ['storageattach', :id,  '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', zpool_disk]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "zfsroot.yml"
  end

end
