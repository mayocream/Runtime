FROM docker.elastic.co/elasticsearch/elasticsearch:6.2.1

# SET TIMEZONE
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone