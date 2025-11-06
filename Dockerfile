# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Java source code into container
COPY Hello.java .

# Compile Java file
RUN javac Hello.java

# Run the Java program
CMD ["java", "Hello"]
