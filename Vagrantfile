# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos7"
  config.vm.box_url = "https://github.com/vezzoni/vagrant-vboxes/releases/download/0.0.1/centos-7-x86_64.box"

  config.vm.define :ansible do |ansible|

    ansible.vm.hostname = "ansible"
    ansible.vm.network :forwarded_port, guest: 80, host: 8080 

    ansible.vm.provision "ansible" do |ansible|

      ansible.inventory_path = "ansible/hosts"
      ansible.playbook = "ansible/playbook.yml"
      ansible.limit = "all"

    end
  end
end

