# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centOS6.5-plain"

  # Apache httpd setup. 
  config.vm.define :web do |web|
    web.vm.hostname = "web"
    web.vm.network :private_network, ip: "192.168.33.10", virtualbox_intnet: true
    web.vm.provision :shell, :inline => <<-EOT

      # Install php-fpm.
      sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
      sudo yum -y install php php-fpm --enablerepo=remi
      sudo chkconfig php-fpm on
      sudo service php-fpm start

      # Install nginx.
      sudo rpm -ivh udo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
      sudo yum -y install nginx
      sudo chkconfig nginx on
      sudo service nginx start
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

