FROM nginx:1.18.0-alpine

COPY start.sh /usr/local/bin/

RUN apk add --no-cache bash \
	&& chmod +x /usr/local/bin/start.sh

EXPOSE 80

CMD ["start.sh"]
