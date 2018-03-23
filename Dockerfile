FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://www.trieuvan.com/apache/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.29/* /usr/local/tomcat/
RUN echo "/usr/local/tomcat/bin/startup.sh" >> /etc/rc.local
RUN wget http://192.168.0.120:8081/nexus/content/repositories/gameoflife/gameoflife-goup/gameoflife.war/2.0/gameoflife.war-2.0.war -O /usr/local/tomcat/webapps/test1.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
