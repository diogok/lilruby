# little ruby app

FROM nickstenning/java7
MANTAINER Diogo Souza <diogo@diogok.net>

ADD lilruby.war /root/lilruby.war
ADD config.yml /root/config.yml
ADD start.sh /root/start.sh
RUN chmod 755 /root/start.sh

CMD ["/root/start.sh"]

EXPOSE 8080

