FROM openresty/openresty:alpine

# SET TIMEZONE
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN adduser -D www-data

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx", "-c", "/etc/nginx/conf.d/conf/nginx.conf", "-g", "daemon off;"]

EXPOSE 80 443