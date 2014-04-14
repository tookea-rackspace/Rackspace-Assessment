class apache2 {

    service { "apache2":
        enable  => true,
        require => Package["apache2"],
        ensure  => running,
    }

    file { "/etc/apache2/apache2.conf":
    ensure  => present,
    source  => "puppet:///modules/apache/apache2.conf",
    notify  => Service["apache2"],
    require => Package["apache2"],
    }

    file { "/etc/apache2/conf.d/charset.conf":
    ensure  => present,
    source  => "puppet:///modules/apache/charset.conf",
    notify  => Service["apache2"],
    require => Package["apache2"],
    }
	
    file { "/etc/apache2/security.conf":
    ensure  => present,
    source  => "puppet:///modules/apache/security.conf",
    notify  => Service["apache2"],
    require => Package["apache2"],
    }	
	
    file { "/etc/apache2/mods-enabled/alias.conf":
    ensure => link,
    target => "../mods-available/alias.conf",
	}	

	file { "/etc/apache2/mods-enabled/alias.load":
	ensure => link,
    target => "../mods-available/alias.load",
	}	
	
	file { "/etc/apache2/mods-enabled/auth_basic.load":
    ensure => link,
    target => "../mods-available/auth_basic.load",
	}	
	
	file { "/etc/apache2/mods-enabled/authn_file.load":
    ensure => link,
    target => "../mods-available/authn_file.load",
	}	
	
	file { "/etc/apache2/mods-enabled/authz_default.load":
    ensure => link,
    target => "../mods-available/authz_default.load",
	}	
	
	file { "/etc/apache2/mods-enabled/authz_groupfile.load":
    ensure => link,
    target => "../mods-available/authz_groupfile.load",
	}	
	
	file { "/etc/apache2/mods-enabled/authz_host.load":
    ensure => link,
    target => "../mods-available/authz_host.load",
	}	
	
	file { "/etc/apache2/mods-enabled/authz_user.load":
    ensure => link,
    target => "../mods-available/authz_user.load",
	}	
	
	file { "/etc/apache2/mods-enabled/autoindex.conf":
    ensure => link,
    target => "../mods-available/autoindex.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/autoindex.load":
    ensure => link,
    target => "../mods-available/autoindex.load",
	}	
	
	file { "/etc/apache2/mods-enabled/cgi.load":
	ensure => link,
    target => "../mods-available/cgi.load",
	}	
	
	file { "/etc/apache2/mods-enabled/deflate.conf":
    ensure => link,
    target => "../mods-available/deflate.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/deflate.load":
    ensure => link,
    target => "../mods-available/deflate.load",
	}	
	
	file { "/etc/apache2/mods-enabled/dir.conf":
    ensure => link,
    target => "../mods-available/dir.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/dir.load":
    ensure => link,
    target => "../mods-available/dir.load",
	}	
	
	file { "/etc/apache2/mods-enabled/env.load":
    ensure => link,
    target => "../mods-available/env.load",
	}	
	
	file { "/etc/apache2/mods-enabled/headers.load":
    ensure => link,
    target => "../mods-available/headers.load",
	}	
	
	file { "/etc/apache2/mods-enabled/mime.conf":
    ensure => link,
    target => "../mods-available/mime.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/mime.load":
    ensure => link,
    target => "../mods-available/mime.load",
	}	
	
	file { "/etc/apache2/mods-enabled/negotiation.conf":
    ensure => link,
    target => "../mods-available/negotiation.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/negotiation.load":
    ensure => link,
    target => "../mods-available/negotiation.load",
	}	
	
	file { "/etc/apache2/mods-enabled/php5.conf":
    ensure => link,
    target => "../mods-available/php5.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/php5.load":
    ensure => link,
    target => "../mods-available/php5.load",
	}	
	
	file { "/etc/apache2/mods-enabled/reqtimeout.conf":
    ensure => link,
    target => "../mods-available/reqtimeout.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/reqtimeout.load":
    ensure => link,
    target => "../mods-available/reqtimeout.load",
	}	
	
	file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "../mods-available/rewrite.load",
	}	
	
	file { "/etc/apache2/mods-enabled/setenvif.conf":
    ensure => link,
    target => "../mods-available/setenvif.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/setenvif.load":
    ensure => link,
    target => "../mods-available/setenvif.load",
	}	
	
	file { "/etc/apache2/mods-enabled/status.conf":
    ensure => link,
    target => "../mods-available/status.conf",
	}	
	
	file { "/etc/apache2/mods-enabled/status.load":
    ensure => link,
    target => "../mods-available/status.load",
	}	
	
	
    file { "/etc/logrotate.d/apache2":
        ensure  => present,
        source  => "puppet:///modules/apache2/logrotate",
        require => Package["apache2"],
    }

    file { "/var/www/":
        ensure => directory,
        mode   => 0755,
		owner   => root,
		group   => root,		
        before => Package["apache2"],
    }

    file { "/var/www/vhosts/":
        ensure  => directory,
        mode    => 0755,
		owner   => root,
		group   => root,			
        before  => Package["apache2"],
        require => File["/var/www/vhosts"],
    }

    file { "/var/log/apache2/":
        ensure => directory,
        owner => root,
        group => adm,		
        mode => 0750,

    }
}


class apache2::wordpress inherits apache2 {

    file { "/etc/apache2/sites-available/wordpress.conf":
    ensure  => present,
    source  => "puppet:///modules/apache2/wordpress.conf",
    }
	
    file { "/etc/apache2/sites-enabled/wordpress.conf":
    ensure => link,
    target => "../sites-available/wordpress.conf",
	}	
}


