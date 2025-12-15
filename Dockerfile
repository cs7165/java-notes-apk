
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .
RUN ./mvnw package || mvn package
EXPOSE 8080
CMD ["java","-jar","target/notes-app-1.0.0.jar"]
