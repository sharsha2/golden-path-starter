# ---- builder stage: full JDK, compiles the jar ----
FROM eclipse-temurin:21-jdk@sha256:85f00967bcc624fc19fa9c2cf124ea426a5363898e267141726f31f358c2e14b AS builder
WORKDIR /app
COPY . .
RUN ./mvnw -q clean package -DskipTests

# ---- final stage: JRE only, no compiler ----
FROM eclipse-temurin:21-jre@sha256:7a65df4b22d2de92d4e04056e884f3b9122d70b21e2847fd66084278bd0ce037
RUN useradd --create-home --uid 10001 app
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
USER app
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "app.jar"]