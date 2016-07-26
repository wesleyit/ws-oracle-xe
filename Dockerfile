FROM centos:latest
MAINTAINER Wesley R. Silva <wesley.silva@concretesolutions.com.br>
RUN yum install -y net-tools pkgconfig tar openssl bc flex vim initscripts bind-utils sed
ADD oracle-xe-11.2.0-1.0.x86_64.rpm /usr/local/src
ADD oracle_silent.rsp  /etc/oracle_silent.rsp
RUN groupadd oracle
RUN useradd oracle -g oracle -s /bin/bash -d /home/oracle -m
RUN yum -y install /usr/local/src/oracle-xe-11.2.0-1.0.x86_64.rpm
RUN rm -f /usr/local/src/oracle-xe-11.2.0-1.0.x86_64.rpm
RUN sed -i 's/^memory_target/#memory_target/g' /u01/app/oracle/product/11.2.0/xe/config/scripts/init*.ora
RUN /etc/init.d/oracle-xe configure responseFile=/etc/oracle_silent.rsp
EXPOSE 1521 
EXPOSE 8080
ADD start_oracle.sh /start_oracle.sh
CMD bash /start_oracle.sh
