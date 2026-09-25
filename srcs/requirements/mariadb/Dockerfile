FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./tools/entrypoint.sh /entrypoint.sh
COPY ./conf/default.conf /etc/mysql/mariadb.conf.d/default.cnf

EXPOSE 3306

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]