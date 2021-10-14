FROM ubuntu:20.04

#Set right time
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y openssh-server sudo iproute2 inetutils-ping vim

RUN groupadd test && useradd -rm -d /home/test -s /bin/bash -g test -G sudo -u 1000 test && \
    usermod -aG sudo test

COPY ssh/sshd_config /etc/ssh/sshd_config

# ssh with key
RUN mkdir /home/test/.ssh
COPY ssh/keys/id_docker_rsa.pub /home/test/.ssh/authorized_keys
RUN chmod 600 /home/test/.ssh/authorized_keys && \
    chown test:test /home/test/.ssh/authorized_keys

RUN service ssh start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
