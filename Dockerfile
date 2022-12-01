FROM maven:3-openjdk-11 as builder
RUN mkdir /spring-petclinic
COPY /spring-petclinic /spring-petclinic
RUN cd spring-petclinic && mvn package

FROM openjdk:11
LABEL author="Arjun"
LABEL project="test"
COPY --from=builder /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-2.7.3.jar" ]