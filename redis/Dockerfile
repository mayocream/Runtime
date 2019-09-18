FROM redis:alpine

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]