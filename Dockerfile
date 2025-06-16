FROM openjdk:17

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependancy:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
