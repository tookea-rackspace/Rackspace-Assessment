class openssh-server {

    package { ["ssh-import-id","openssh-server"]:
        ensure  => installed,
    }
}	
