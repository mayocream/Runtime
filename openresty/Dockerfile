FROM openresty/openresty:alpine-fat

RUN adduser -D www-data

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx", "-c", "/etc/nginx/conf.d/conf/nginx.conf", "-g", "daemon off;"]

EXPOSE 80 443