# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ## Uncomment this lines to download a different version of the
  ## Vagrant box
  #config.vm.box = "precise64"
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.box = "precise"

   config.vm.provider :virtualbox do |vb|
     # Don't boot with headless mode
     vb.gui = true
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "512"]
   end

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 384]
    v.customize ["modifyvm", :id, "--name", "vagrant-dev"]
  end

  config.vm.provision :puppet do |puppet|
     puppet.pp_path = "/tmp/vagrant-puppet"
     puppet.manifests_path = "manifests"
     puppet.module_path    = "modules"
  end

end
