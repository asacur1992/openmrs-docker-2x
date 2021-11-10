FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD=HIsf0rICAP
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=HIsf0rICAP
ENV MYSQL_DATA_DIRECTORY=/var/lib/mysql

ADD mysql.cnf /root/.my.cnf
ADD localtime /etc/localtime

RUN chmod 664 /root/.my.cnf

COPY run.sh /run.sh

EXPOSE 3306

CMD ["/run.sh"]
