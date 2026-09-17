FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y --no-install-recommends nginx && \
	rm -rf /var/lin/apt/lists/* 

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx"]

CMD ["-g", "daemon off;"]
