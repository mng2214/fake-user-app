FROM adoptopenjdk/openjdk11:jre

WORKDIR usr/app

COPY target/fake-user-app-0.0.1-SNAPSHOT.jar fake-user-app-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","fake-user-app-0.0.1-SNAPSHOT.jar"]