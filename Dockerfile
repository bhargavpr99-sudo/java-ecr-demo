# Use official OpenJDK base image
FROM openjdk:17-alpine

# Set working directory
WORKDIR /app

# Copy Java source code into container
COPY HelloWorld.java .

# Compile the Java file
RUN javac HelloWorld.java

# Run the compiled Java program
CMD ["java", "HelloWorld"]
