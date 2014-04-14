class memcached {

     package { "memcached":
	ensure => present
}

    file { "/etc/memcached.conf":
    ensure  => present,
    source  => "puppet:///modules/memcached/memcached.conf",
    notify  => Service["memcached"],
    require => Package["memcached"],
    }


    service { "memcached":
        enable  => true,
	require => File["/etc/memcached.conf"],
        ensure  => running,
    }
}
