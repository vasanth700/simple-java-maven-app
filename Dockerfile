FROM maven:3.8.4-jdk-8 AS mvn
COPY . /app/
RUN mvn -f /app/pom.xml clean install -Dmaven.test.skip

FROM openjdk:8-jdk-alpine
COPY --from=mvn /app/target/spring-boot-jpa-postgresql-0.0.1-SNAPSHOT.jar 0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/0.0.1-SNAPSHOT.jar"]
