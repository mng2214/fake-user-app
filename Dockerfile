# Use a lightweight JRE version for production
FROM adoptopenjdk/openjdk11:jre-slim

# Set the working directory in the container
WORKDIR /usr/app

# Copy the built jar file from your local machine to the container
COPY target/fake-user-app-0.0.1-SNAPSHOT.jar fake-user-app-0.0.1-SNAPSHOT.jar

# Expose the default port Spring Boot uses (8080)
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "fake-user-app-0.0.1-SNAPSHOT.jar"]
