FROM maven:3.6-jdk-8-alpine
WORKDIR /app     
RUN apk add git
RUN git clone https://gitlab.com/ot-interview/javaapp.git /app
RUN mvn package
FROM tomcat:9.0
LABEL name="Ishwarya"
WORKDIR /app
COPY --from=0 /app/target/Spring3HibernateApp.war /usr/local/tomcat/webapps      
EXPOSE 9090
