FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y --no-install-recommends nginx openssl gettext-base  && \
	rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/C=DE/ST=BW/L=City/O=42/OU=School/CN=localhost"

EXPOSE 443

COPY ./tools/entrypoint.sh /entrypoint.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf.template
COPY ./tools/index.html /var/www/html/index.html

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

