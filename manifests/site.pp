node default {
# server build config via   tasksel --list-tasks
	include server, openssh-server, lamp-server, cloud-image
# generic server configs
	include ntp, memcached, sshd
# wordpress config
	include wordpress, apache2::wordpress, mysqld::wordpress
}
