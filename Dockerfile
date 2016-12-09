FROM yamamuteki/debian-etch-i386

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /

RUN cat /dev/null >/etc/apt/sources.list
RUN echo 'deb http://archive.debian.org/debian etch main' >>/etc/apt/sources.list
RUN echo 'deb http://archive.debian.org/debian etch contrib' >>/etc/apt/sources.list
RUN echo 'deb http://archive.debian.org/debian etch non-free' >>/etc/apt/sources.list
RUN apt-get update 
#RUN apt-get install -y apt-utils
#RUN apt-get -y install curl
RUN apt-get -y install unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN curl -fSL http://www.sopsr.sk/istb/download/sk2sk.gz -o sk2sk.gz 
ADD sk2sk.gz sk2sk.gz
RUN gunzip sk2sk.gz
RUN chmod +x sk2sk
#RUN curl -fSL http://www.sopsr.sk/istb/download/do_kmGrid.zip -o kmGrid.zip
ADD kmGrid.zip kmGrid.zip
RUN unzip -d kmGrid kmGrid.zip
RUN chmod -R 0755 kmGrid
RUN rm kmGrid.zip

ADD libc6.zip libc6.zip
RUN unzip libc6.zip
RUN cp libstdc++-3-libc6.2-2-2.10.0.so /usr/lib/
RUN cd /usr/lib/ &&ln -s /usr/lib/libstdc++-3-libc6.2-2-2.10.0.so libstdc++-libc6.2-2.so.3
RUN cd /
CMD echo -e "EXAMPLES:\n" \
	"\tdocker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d J'\n" \
	"\tdocker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d 3'\n" \
	"\tdocker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d 4'\n" \
	"\tdocker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo -390563 -1250645 |/sk2sk -d W'\n" \
	""
