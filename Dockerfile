FROM nginx:alpine
COPY . /app
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN apk add --no-cache bash
EXPOSE 8080
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/conf.d/default.conf > /tmp/default.conf && mv /tmp/default.conf /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
