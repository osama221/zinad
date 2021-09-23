FROM debian:
RUN groupadd -r -g 900 mysql && useradd -m -r -g mysql -u 900 mysql

RUN apt-get update && apt-get install -y --no-install-recommends \
  gnupg \
  dirmngr \ 
  procps \
RUN set -eux 
  
ENV MYSQL_ROOT_PASSWORD "root"
ENV MYSQL_DATABASE "mydb"
ENV MYSQL_USER = mysql
ENV MYSQL_PASSWORD =mysql


COPY config/ /etc/mysql/ docker_entrypoint.sh /usr/local/bin/

ENTRYPOINT["docker_entrypoint.sh"]

EXPOSE 3306 33060

CMD []

