FROM ubuntu:latest

# SSH install
RUN apt-get update && apt-get upgrade -y && \
	  apt-get install -y openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh -p && \
    chmod 700 /home/remote_user/.ssh && \
    mkdir -p -m0755 /var/run/sshd

RUN chown remote_user:remote_user   -R /home/remote_user

# Java 8 install
# https://hub.docker.com/r/picoded/ubuntu-openjdk-8-jdk/dockerfile/
# This is in accordance to : https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
RUN apt-get install -y openjdk-8-jdk && \
	  apt-get install -y ant && \
	  apt-get clean && \
	  rm -rf /var/lib/apt/lists/* && \
	  rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	  apt-get install -y ca-certificates-java && \
	  apt-get clean && \
	  update-ca-certificates -f && \
	  rm -rf /var/lib/apt/lists/* && \
	  rm -rf /var/cache/oracle-jdk8-installer;

# Install python modules
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get install python3-pip -y
RUN pip3 install selenium
RUN pip3 install -U pytest

CMD /usr/sbin/sshd -D
