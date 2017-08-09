# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centOS6.5-plain"

  # Apache httpd setup. 
  config.vm.define :web do |web|
    web.vm.hostname = "web"
    web.vm.network :private_network, ip: "192.168.33.10", virtualbox_intnet: true
    web.vm.provision :shell, :inline => <<-EOT
      sudo yum -y install httpd
      sudo chkconfig httpd on
      sudo service httpd start
    EOT
  end

  # MySQL setup.
  config.vm.define :db do |db|
    db.vm.hostname = "db"
    db.vm.network :private_network, ip: "192.168.33.11", virtualbox_intnet: true
    db.vm.provision :shell, :inline => <<-EOT
      sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
      sudo yum -y install mysql-community-server
      sudo chkconfig mysqld on
      sudo service mysqld start
    EOT
  end

end

