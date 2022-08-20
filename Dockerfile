FROM ubuntu

RUN apt -y update

RUN apt -y install vsftpd

COPY ./vsftpd.conf /etc/

COPY ./vsftpd.chroot_list /etc/

RUN mkdir /var/run/vsftpd

RUN mkdir /var/run/vsftpd/empty

RUN mkdir /ftp

COPY ./start.sh /etc/

RUN chmod +x /etc/start.sh

ENTRYPOINT /etc/start.sh