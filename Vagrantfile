# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  net_ip = "10.253.0"

  config.vm.box = "ubuntu/xenial64"
  config.hostmanager.enabled = true

  config.vm.define :master, primary: true do |master|

    master.vm.hostname = :master
    master.vm.network "private_network", ip: "#{net_ip}.10", hostsupdater: "skip"
    master.vm.synced_folder "saltstack/salt", "/srv/salt"
    master.vm.synced_folder "saltstack/pillar", "/srv/pillar"

    master.vm.provider "virtualbox" do |vb|
      vb.name = "salt-master"
      vb.memory = "1024"
      vb.cpus = "1"
    end

    master.vm.provision "shell", path: "provisioning/master.sh"

  end

  [
      ["minion1", "#{net_ip}.11", "1024"],
      ["minion2", "#{net_ip}.12", "1024"],
  ].each do |vmname, ip, mem|
    config.vm.define :"#{vmname}" do |minion|

      minion.vm.hostname = "#{vmname}"
      minion.vm.network "private_network", ip: "#{ip}", hostsupdater: "skip"
      minion.vm.provider "virtualbox" do |vb|
        vb.name = "salt-#{vmname}"
        vb.memory = "#{mem}"
        vb.cpus = "1"
      end

      minion.vm.provision "file", source: "provisioning/minion", destination: "/home/vagrant/minion"
      minion.vm.provision "shell", path: "provisioning/minion.sh"
    end

  end

end