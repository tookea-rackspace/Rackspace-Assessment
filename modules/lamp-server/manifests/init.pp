class lamp-server {

	package {["libmysqlclient18","apache2","php5-cli","apache2.2-common","apache2-utils","libswitch-perl",
"php5-common","libaprutil1-ldap","libdbi-perl","mysql-server","apache2.2-bin","libdbd-mysql-perl",
"libhtml-template-perl","perl-modules","libnet-daemon-perl","libapr1","mysql-server-core-5.5",
"apache2-mpm-prefork","libwrap0","libaprutil1-dbd-sqlite3","tcpd","libapache2-mod-php5","libclass-isa-perl",
"libaprutil1","php5-mysql","libplrpc-perl","mysql-client-5.5","mysql-server-5.5","libcap2","perl",
"mysql-client-core-5.5","ssl-cert","mysql-common"]:
        ensure  => installed,
    }
}	

