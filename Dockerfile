FROM openjdk:17

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
CMD ["chmod +x mvnw"]
RUN ./mvnw dependancy:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
