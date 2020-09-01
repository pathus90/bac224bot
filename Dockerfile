FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
MAINTAINER pathus90
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package

FROM openjdk:8-jdk-alpine
WORKDIR /app
ARG JAR_FILE=/build/target/messenger4j-spring-boot-quickstart-template-2.0.0.jar

EXPOSE 8080

COPY --from=MAVEN_BUILD ${JAR_FILE}  /app/
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar", "messenger4j-spring-boot-quickstart-template-2.0.0.jar"]