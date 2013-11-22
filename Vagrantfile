# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "raring32"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box"

    config.vm.provision :shell, :path => "bootstrap.sh"

    config.vm.network :forwarded_port, host: 9494, guest: 9292 # rackup
    config.vm.network :forwarded_port, host: 5999, guest: 5984 # couchdb
end

