# Pull base image with Java
FROM openjdk:21-jdk

# Maintainer
MAINTAINER "Elias"

# Copy the jar built by Maven
COPY server/target/server.jar /app/server.jar

# Run the jar
ENTRYPOINT ["java", "-jar", "/app/server.jar"]
