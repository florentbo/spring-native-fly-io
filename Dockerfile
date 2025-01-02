FROM container-registry.oracle.com/graalvm/native-image:21-ol8 AS builder

# Install Maven
RUN microdnf install maven

WORKDIR /build
COPY . /build
RUN mvn package

FROM container-registry.oracle.com/graalvm/jdk:21-ol8
WORKDIR /app
COPY --from=builder /build/target/benchmark-jibber-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
