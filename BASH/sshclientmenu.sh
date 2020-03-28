#!/usr/bin/env bash
# This script need espeak, you can install it :
# apt-get install espeak / yum install espeak
sship=0.0.0.0
sshuser=user
sftpip=0.0.0.0
sftpuser=user
mode=ssh

printf '
╔══════════════════════════╗
║ Secure SHell Client Tool ║
╚══════════════════════════╝

This tool allow you to connect
SSH Servers, SFTP Servers using
your own OpenSSH installation
(ssh/sftp command)

You can run this tool as superuser
if **REALLY** needed.

You need to run in ssh or sftp mode?

1) ssh mode 	(Secure Shell Console)
2) sftp mode 	(Secure File Transfert Protocol)

[1/2/Abort]
'
echo "Welcome" | espeak -venglish
echo
echo "Your hostname is `hostname`"
echo
echo -n "mode="
read mode
if [[ $mode = 1 ]]
then
	echo -n "Target IP : "
	read sship
	echo -n "Target Login : "
	read sshuser
	echo
	printf '
╔═══════════════════════════╗
║ SSH STARTED LOGIN SESSION ║
╚═══════════════════════════╝
	'
	echo "SSH Started Login Session" | espeak -venglish
	echo
	ssh $sship -l $sshuser 2> /dev/null
	echo "Good Bye" | espeak -venglish
elif [[ $mode = 2 ]]
then
	echo -n "Target IP : "
	read sftpip
	echo -n "Target Login : "
	read sftpuser
	echo
	printf '
╔════════════════════════════╗
║ SFTP STARTED LOGIN SESSION ║
╚════════════════════════════╝
	'
	echo "SFTP Started Login Session" | espeak -venglish
	echo
	sftp $sftpuser@$sftpip 2> /dev/null
	echo "Connection Closed. Good Bye !" | espeak -venglish
fi