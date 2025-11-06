FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]

