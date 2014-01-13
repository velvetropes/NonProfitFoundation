Vagrant.configure("2") do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.network :private_network, ip: "10.11.0.101"
  config.vm.network :forwarded_port, host: 8080, guest: 80
  config.vm.synced_folder ".", "/var/www/starkey/", owner: "www-data", group: "www-data"
  config.vm.provision :shell, :path => "provision.sh"
end
