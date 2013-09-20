# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :virtualbox do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
     vb.customize ["modifyvm", :id, "--name", "3scale-proxy"]
  end

  config.vm.define :ubuntu do |conf|
    conf.vm.box = 'precise64'
    conf.vm.network :private_network, ip: '192.168.50.4'
    conf.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    conf.vm.hostname = "3scale-ubuntu.example.com"
  end

  config.vm.define :centos do |conf|
    conf.vm.box = "puppet-centos-63"
    conf.vm.network :private_network, ip: "192.168.50.5"
    conf.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box"
    conf.vm.hostname = "3scale-centos6.example.com"
  end

  config.vm.define :centos58 do |conf|
    conf.vm.box = "puppet-centos-58"
    conf.vm.network :private_network, ip: "192.168.50.6"
    conf.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-58-x64.box"
    conf.vm.hostname = "3scale-centos5.example.com"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "default.pp"
    puppet.options        = ['--verbose --debug  --summarize']
  end

  # Forward Nginx port 80 from guest to 8080 on host.
  config.vm.network "forwarded_port", guest: 80, host: 8080

end
