FROM ubuntu:bionic

LABEL maintainer="Guys <guyschaos@gmail.com>"

RUN apt-get update \
  && apt-get install -y libssl1.0.0 \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/pymumu/smartdns/releases/download/Release22/smartdns.1.2019.04.02-0832.x86_64.tar.gz \
  && tar zxvf smartdns.*.x86_64.tar.gz \
  && cp smartdns/src/smartdns /bin/smartdns \
  && rm -rf smartdns* \
  && apt-get -y --purge remove wget

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]
