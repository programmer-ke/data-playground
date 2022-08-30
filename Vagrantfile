# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "master" => {
    "ip" => "192.168.30.30"
  },
  "worker1" => {
    "ip" => "192.168.30.31"
  },
  "worker2" => {
    "ip" => "192.168.30.32"
  },
}

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # Use the default key (insecure key) on all VMs
  # instead of generating new ones. More closely emulates Ansible behavior
  # in the remote setup.
  # Private key path: ~/.vagrant.d/insecure_private_key
  config.ssh.insert_key = false

  hosts.each do |name, info|

    config.vm.define name do |machine|
      machine.vm.box = "debian/bullseye64"
      machine.vm.hostname = name
      machine.vm.network :private_network, ip: info["ip"]
      
      # configure virtualbox characteristics
      machine.vm.provider "virtualbox" do |v|
        v.name = name
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", "2"]
      end

    end

  end

  # configure ansible provisioning characteristics
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "cluster.yml"
    ansible.inventory_path = "hosts.ini"
  end

end
