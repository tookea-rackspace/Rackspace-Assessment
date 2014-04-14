class mysqld {

    service { "mysql":
        enable  => true,
        require => Package["mysql-server"],
        ensure  => running
    }

    file { "/etc/mysql_grants.sql":
    ensure  => present,
    mode  => 600,
    source  => "puppet:///modules/mysqld/mysql_grants.sql",
    }

    file { "/etc/mysql/debian.cnf":
    ensure  => present,
    mode  => 600,
    source  => "puppet:///modules/mysqld/debian.cnf",
    }

    file { "/etc/mysql/debian-start":
    ensure  => present,
    source  => "puppet:///modules/mysqld/debian-start",
    }

    file { "/etc/mysql/my.cnf":
    ensure  => present,
    source  => "puppet:///modules/mysqld/my.cnf",
    }
}

class mysqld::wordpress inherits mysqld {

    file { "/etc/mysql_wordpress.sql":
    ensure  => present,
    mode  => 600,
    source  => "puppet:///modules/mysqld/mysql_wordpress.sql",
    }
}
