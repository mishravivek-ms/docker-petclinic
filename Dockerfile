# Use the official Maven image to build the app
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use the official OpenJDK image to run the app
FROM maven:3.9.5-eclipse-temurin-17
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
