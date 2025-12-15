# Use an official Eclipse Temurin runtime as a parent image

# Use Maven Wrapper to build the application
FROM eclipse-temurin:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Build the application using Maven Wrapper
RUN ./mvnw package || mvn package

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
CMD ["java","-jar","target/notes-app-1.0.0.jar"]
