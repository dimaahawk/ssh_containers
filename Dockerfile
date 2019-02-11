FROM ubuntu:16.04

ARG USER_NAME='default'

RUN apt-get update && apt-get install -y openssh-server vim irssi screen tmux
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN adduser --home /home/${USER_NAME}/ --shell /bin/bash --disabled-password --gecos "" ${USER_NAME}
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
