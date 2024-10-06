# First stage: Build the application using Maven and JDK 17
FROM maven:3.8.8-eclipse-temurin-17 AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy pom.xml and download dependencies (this step is cached)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Run the Maven clean install to build the project
RUN mvn clean install

# Second stage: Create the runtime image with JRE 17
FROM eclipse-temurin:17

# Set the working directory in the container
WORKDIR /usr/app

# Copy the JAR file from the build stage
COPY --from=build /usr/src/app/target/fake-user-app-0.0.1-SNAPSHOT.jar fake-user-app-0.0.1-SNAPSHOT.jar

# Expose the default port for the application
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "fake-user-app-0.0.1-SNAPSHOT.jar"]
