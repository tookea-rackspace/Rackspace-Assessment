class ntp {

    package { "ntp":
        ensure  => latest,
    }

    service { "ntp":
        enable  => true,
        require => Package["ntp"],
        ensure  => running
    }

    file { "/etc/ntp.conf":
        source => "puppet:///modules/ntp/ntp.conf",
    	require => Package["ntp"],
    }

    file { "/etc/ntp.leapseconds":
        source => "puppet:///modules/ntp/ntp.leapseconds",
    	require => Package["ntp"],
    }
}

