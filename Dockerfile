FROM python:2.7-alpine

LABEL Author="glzjin <i@zhaoj.in>" Blog="https://www.zhaoj.in"

ENV FLASK_APP=app.py FLASK_ENV=production

COPY app /app

RUN adduser -h /app glzjin -D && \
	sed -i 's/dl-cdn.alpinelinux.org/mirror.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
	apk update && \
	apk add --no-cache gcc libc-dev libffi-dev libxml2-dev python-dev libxml2-dev g++ libxslt-dev curl && \
	pip install \
	-i http://mirrors.aliyun.com/pypi/simple/ \
	--trusted-host mirrors.aliyun.com \
	-r /app/requirements.txt && \
	mv /app/docker-entrypoint /usr/local/bin/docker-entrypoint && \
	chmod +x /usr/local/bin/docker-entrypoint && \
	mv /app/flag.sh / && \
	rm -rf /tmp/* && \
	apk add --update redis && \
  rm -rf /var/cache/apk/* && \
  mkdir /data && \
  chown -R glzjin:glzjin /data && \
  chown -R glzjin:glzjin /var/lib/redis && \
  sed -i 's#redis:/bin/false#redis:/sbin/nologin#i' /etc/passwd && \
  sed -i 's#logfile /var/log/redis/redis.log#logfile ""#i' /etc/redis.conf && \
  sed -i 's#daemonize yes#daemonize no#i' /etc/redis.conf && \
  sed -i 's#dir /var/lib/redis/#dir /data#i' /etc/redis.conf && \
  sed -i 's#bind 127.0.0.1#bind 0.0.0.0#i' /etc/redis.conf && \
	sed -i 's#unixsocket #\#unixsocke t#i' /etc/redis.conf && \
  echo -e "# placeholder for local options\nrequirepass chocolate\n" > /etc/redis-local.conf && \
  echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

EXPOSE 8080

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
