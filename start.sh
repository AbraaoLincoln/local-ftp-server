#!/bin/bash

username=ftpuser
password=123

userNotExists() {
    id $username  &> /dev/null
    [ $? -eq 1 ]
}

if userNotExists; then
    useradd -m "$username"
    echo "${username}:${password}" | chpasswd # --encrypted
    mkdir /ftp/"${username}_data"
    chown $username /ftp/"${username}_data"
fi

/usr/sbin/vsftpd /etc/vsftpd.conf

