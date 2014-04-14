class wordpress {

	file { "/root/apengue.test.tgz":
   	ensure  => present,
    	source  => "puppet:///modules/wordpress/apengue.test.tgz",
    	}
	
	exec { "unzip_apengue.test":
	command => "/bin/tar -xzf /root/apengue.test.tgz -C /root",
	creates => "/root/apengue.test"
	}
	
	exec { "copy_wordpress_install":
	command => "/bin/cp -R /root/apengue.test/files/var/www/vhosts/lin-test.rackstage.co.uk /var/www/vhosts",
	creates => "/var/www/vhosts/lin-test.rackstage.co.uk",
	}	

	exec { "setup_wordpress_mysql":
	command => "/usr/bin/mysql -pqjhtLOiekxWz0BzpDEn0 < /etc/mysql_wordpress.sql > /etc/mysql_wordpress.log",
	creates => "/etc/mysql_wordpress.log"
	}
}
