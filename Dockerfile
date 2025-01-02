FROM container-registry.oracle.com/graalvm/jdk:21-ol8
VOLUME /tmp
COPY target/benchmark-jibber-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
