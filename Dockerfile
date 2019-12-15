FROM resin/rpi-raspbian:jessie

ENV    SQUEEZE_VOL_PERSIST=/var/lib/squeezeboxserver \
	SQUEEZE_VOL_LOG=/var/log/squeezeboxserver \
	LANG=C.UTF-8 \
	LMS_URL=http://downloads-origin.slimdevices.com/nightly/7.9/sc/0116432ea65227ec1453cb70cf0226019f325d29/logitechmediaserver_7.9.2~1576322676_arm.deb

RUN apt-get update && \
    apt-get -y install perl adduser iproute iputils-ping curl wget faad flac lame sox libio-socket-ssl-perl && \
    curl -Lf -o /tmp/lms.deb $LMS_URL && \
	dpkg -i /tmp/lms.deb && \
	rm -f /tmp/lms.deb && \
	apt-get clean

VOLUME 	$SQUEEZE_VOL_PERSIST $SQUEEZE_VOL_LOG
EXPOSE 	3483 3483/udp 9000 9090

COPY entrypoint.sh.txt /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
