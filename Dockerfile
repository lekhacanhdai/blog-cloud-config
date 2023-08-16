FROM openjdk:11

COPY /target/blog-cloud-config-0.0.1-SNAPSHOT.jar blog-cloud-config-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "blog-cloud-config-0.0.1-SNAPSHOT.jar"]