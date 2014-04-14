/** Setup new wordpress database **/

CREATE DATABASE lintest_wpdb;

CREATE USER lintest_user@localhost;

SET PASSWORD FOR lintest_user@localhost= PASSWORD('YsbaFTP875qn_xKqQWY5');

GRANT ALL PRIVILEGES ON lintest_wpdb.* TO lintest_user@localhost IDENTIFIED BY 'YsbaFTP875qn_xKqQWY5';

FLUSH PRIVILEGES;

