FROM openjdk:8-jdk-alpine
MAINTAINER pathus90
VOLUME /tmp
ARG JAR_FILE=target/messenger4j-spring-boot-quickstart-template-2.0.0.jar
COPY ${JAR_FILE} bac224Bot.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/bac224Bot.jar"]