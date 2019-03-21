FROM docker.io/mysql:5.7
MAINTAINER xuhailong 605152982@qq.com
ENV MYSQL_DATABASE zabbix
ENV MYSQL_USER zabbix
ENV MYSQL_PASSWORD Databea_zab01
ENV MYSQL_ROOT_PASSWORD Databea_Root01
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
