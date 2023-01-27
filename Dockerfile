FROM tomcat:8.0.51-jre8-alpine
MAINTAINER sachinmane
# copy war file on to container
COPY ./target/Advik*.jar /usr/local/tomcat/webapps
EXPOSE  8080 80
USER Advik
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]