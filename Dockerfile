FROM nginx:1.18.0-alpine

COPY start.sh /usr/local/bin/

RUN apk add --no-cache bash \
	&& chmod -R g+w        /var/cache/nginx /var/log/nginx /etc/nginx \
	&& chown -R nginx:root /var/cache/nginx /var/log/nginx /etc/nginx \
	&& chmod g+w /run \
	&& sed -i 's/user  nginx;//g' /etc/nginx/nginx.conf \
	&& chmod +x /usr/local/bin/start.sh

EXPOSE 80

USER 1000

CMD ["start.sh"]
