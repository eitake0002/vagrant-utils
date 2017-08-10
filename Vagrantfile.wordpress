# -*- mode: ruby -*-
# vi: set ft=ruby :

# OS : CentOS6
# Apache : 2.2
# MySQL  : 5.6
#   DB_NAME : wordpress
#   USERNAME: wordpress
# PHP    : 7.0

Vagrant.configure("2") do |config|
  
  config.vm.box = "centOS6.5-plain"

  # Apache httpd setup.
  config.vm.define :web do |web|
    web.vm.hostname = "web"
    web.vm.network :private_network, ip: "192.168.33.10", virtualbox_intnet: true
    web.vm.provision :shell, :inline => <<-EOT

      # Install remi repo.
      sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

      # Install epel repo.
      sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

      # Install php7
      sudo yum install -y --enablerepo=remi,remi-php70 php php-devel php-mysql php-mbstring php-pdo php-gd php-xml php-mcrypt

      # Install httpd.
      sudo yum -y install httpd
      sudo chkconfig httpd on
      sudo service httpd start

      # Install mysql and setup.
      sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
      sudo yum -y install mysql-community-server
      sudo chkconfig mysqld on
      sudo service mysqld start
      mysql -uroot -e "create database wordpress"
      mysql -uroot -e "grant all privileges on wordpress.* to wordpress@localhost identified by 'wordpress'"
      mysql -uroot -e "flush privileges"

      # Install wordpress.
      cd /var/www/html
      curl -LO http://ja.wordpress.org/latest-ja.tar.gz
      tar xvzf latest-ja.tar.gz
      rm -rf latest-ja.tar.gz
      cp -f /vagrant/wp-config.php /var/www/html/wordpress/wp-config.php
      sudo chown -R apache:apache /var/www/html/wordpress

      # Restart httpd.
      sudo service httpd restart
    EOT
  end
end

