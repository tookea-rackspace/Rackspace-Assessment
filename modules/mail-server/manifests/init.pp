class mail-server {

	package {["dovecot-imapd","procmail","dovecot-core","postfix","libpth20","libtokyocabinet8",
"libgpgme11","mutt","ssl-cert","dovecot-pop3d","bsd-mailx"]:
    ensure  => installed,
    }
}
