class cloud-image {

    package { ["aptitude","apt-xapian-index","cloud-init","cloud-utils","euca2ools","grub-legacy-ec2","laptop-detect","libboost-iostreams1.46.1","libclass-accessor-perl","libcwidget3","libept1.4.12","libio-string-perl","libparse-debianchangelog-perl","libsigc++-2.0-0c2a","libsub-name-perl","libtimedate-perl","libxapian22","libyaml-0-2","python-boto","python-cheetah","python-configobj","python-m2crypto","python-paramiko","python-pycurl","python-software-properties","python-xapian","python-yaml","tasksel","tasksel-data","unattended-upgrades"]:
        ensure  => installed,
    }
    package { ["cloud-initramfs-rescuevol","libc6-xen","cloud-initramfs-growroot"]:
	ensure => purged,
    }
}	
