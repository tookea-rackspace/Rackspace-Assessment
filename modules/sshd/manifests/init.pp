class sshd {

    package { "openssh-client":
        ensure  => present,
    }

    service { "ssh":
        enable  => true,
        require => Package["openssh-server"],
        ensure  => running
    }

    file { "/etc/ssh/ssh_config":
        source => "puppet:///modules/sshd/ssh_config",
    	require => Package["openssh-client"],
    }

    file { "/etc/ssh/sshd_config":
        source => "puppet:///modules/sshd/sshd_config",
    	require => Package["openssh-server"],
    }

    file { "/etc/ssh/moduli":
        source => "puppet:///modules/sshd/moduli",
    }

    file { "/etc/ssh/ssh_host_dsa_key":
        source => "puppet:///modules/sshd/ssh_host_dsa_key",
	mode => "600"
    }

    file { "/etc/ssh/ssh_host_dsa_key.pub":
        source => "puppet:///modules/sshd/ssh_host_dsa_key.pub",
    }

    file { "/etc/ssh/ssh_host_ecdsa_key":
        source => "puppet:///modules/sshd/ssh_host_ecdsa_key",
	mode => "600"
    }

    file { "/etc/ssh/ssh_host_ecdsa_key.pub":
        source => "puppet:///modules/sshd/ssh_host_ecdsa_key.pub",
    }

    file { "/etc/ssh/ssh_host_rsa_key":
        source => "puppet:///modules/sshd/ssh_host_rsa_key",
	mode => "600"
    }

    file { "/etc/ssh/ssh_host_rsa_key.pub":
        source => "puppet:///modules/sshd/ssh_host_rsa_key.pub",
    }

    file { "/etc/ssh/ssh_import_id":
        source => "puppet:///modules/sshd/ssh_import_id",
    }
}

