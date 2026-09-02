# Build the executable JAR with the required toolchain.
FROM maven:3.9.16-eclipse-temurin-21 AS builder

WORKDIR /workspace

# Copy build descriptors first so Docker can cache dependency downloads.
COPY pom.xml ./
COPY .mvn .mvn
COPY settings.xml ./
RUN mvn -B -DskipTests dependency:go-offline

COPY src src
RUN mvn -B -DskipTests clean package

# Run the application with a small JRE-only image.
FROM eclipse-temurin:21-jre

WORKDIR /app

RUN useradd --system --uid 10001 spring
COPY --from=builder /workspace/target/simple-spring-boot-demo-0.0.1-SNAPSHOT.jar app.jar

USER spring
EXPOSE 8888

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
