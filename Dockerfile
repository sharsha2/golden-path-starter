# ---- builder stage: full JDK, compiles the jar ----
FROM eclipse-temurin:21-jdk@sha256:efd34b940f2d5a621605c8531c2afb7759c936b6c2ef637a69aa3bf3e1e789d1 AS builder
WORKDIR /app
COPY . .
RUN ./mvnw -q clean package -DskipTests

# ---- final stage: JRE only, no compiler ----
FROM eclipse-temurin:21-jre@sha256:8cef5fc7bebe421363ab543a2f4db5caf7d119d8db67d56b0f56c485d2de4d55
RUN useradd --create-home --uid 10001 app
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
USER app
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "app.jar"]