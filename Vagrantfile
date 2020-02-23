Vagrant.configure("2") do |config|
  config.vm.define :appserver do |appserver|
    appserver.vm.box = "bento/debian-10"
    appserver.vm.network "private_network", ip: "192.168.2.112"
    appserver.vm.network "forwarded_port", guest: 80, host: 3000
    appserver.vm.synced_folder "shell" , "/var/www"
    appserver.vm.provision :shell, :path => "install_docker.sh"
  end
end
