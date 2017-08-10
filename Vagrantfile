# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centOS6.5-plain"

  # Apache httpd setup.
  config.vm.define :ansible do |ansible|
    ansible.vm.hostname = "ansible"
    ansible.vm.network :private_network, ip: "192.168.33.10", virtualbox_intnet: true
    ansible.vm.provision "ansible" do |ansible|
      ansible.inventory_path = "ansible/hosts"
      ansible.playbook = "ansible/playbook.yml"
      ansible.limit = "all"
    end
  end
end

