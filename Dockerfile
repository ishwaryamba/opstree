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


#TASK: Dockerize the given application. 
#Process: SSH into EC2 machine
#run "yum update" command to update applications installed on the system
#install docker in the machine using "yum install docker"
#start the docker using the command "service docker start"
#create Dockerfile using "vi Dockerfile" command


#the base image is taken from maven:3.6 with jdk version of 8 and alpine linux is taken as it keeps the docker image lighter
#the defined working directory is /app
#using Alpine Linux package manager, add git
#using git clone command, clone the required code to the working directory /app
#using the maven package command, take the compiled code and package it in its distributable format, WAR
#take the base image from tomcat:8.0
#provide the maintainer's name in the label
#mention the working directory /app
#copy the war file from the maven's target folder to the tomcat default path /usr/local/tomcat/webapps
#expose 9090 folder as this is the requested port no for expose


#sudo docker build -t assignment:v1 .
#create a docker image using this command whereby -t stands for terminal, v1 stands for tag and . is used for mentioning the current path

#sudo docker images
#check if the required image is created using this command

#sudo docker run -d --name finalassignment -p 9090:8080 assignment:v1
#create a docker container using this command whereby -d stands for detached mode, -p is port, 9090 is the desired port no while the tomcat default port no is 8080 

#sudo docker ps
#check if the required container is created using this command

#http://<ip_address>:9090/Spring3HibernateApp 
#check the final status of the docterized application using the above link  
#Sample WebApp CRUD Example for CI







