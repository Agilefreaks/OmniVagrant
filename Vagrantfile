# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'hashicorp/precise64'

  config.vm.define 'dev' do |dev|
    dev.vm.hostname = 'dev'
  end

    $script = <<SCRIPT  
  wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs-release-precise.deb
  rm puppetlabs-release-precise.deb
  
  apt-get update -y --fix-missing
  apt-get install puppet-common -y
SCRIPT

  config.vm.provision :shell, :inline => $script

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file  = 'site.pp'
    puppet.options = '--verbose'
  end
end
