# Use OpenJDK 21 as the base image
FROM openjdk:21-slim

# Install Maven 3.9.9 manually (stable version)
RUN apt-get update && apt-get install -y wget && \
    wget https://downloads.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz -P /tmp && \
    tar -xvzf /tmp/apache-maven-3.9.9-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.9.9/bin/mvn /usr/bin/mvn

# Install Tomcat manually
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz -P /tmp && \
    tar -xvzf /tmp/apache-tomcat-9.0.52.tar.gz -C /usr/local && \
    rm /tmp/apache-tomcat-9.0.52.tar.gz

# Set the working directory for Tomcat
WORKDIR /usr/local/apache-tomcat-9.0.52

# Copy the Maven project files into the container
COPY . /usr/local/apache-tomcat-9.0.52/webapps/comp367-lab2-webapp/
#COPY . /usr/local/apache-tomcat-9.0.52/webapps/

# Set the working directory inside the Maven project
WORKDIR /usr/local/apache-tomcat-9.0.52/webapps/comp367-lab2-webapp/

# Run Maven to package the .war file inside the container
RUN mvn clean install

# Copy the generated WAR file to Tomcat's webapps directory
COPY target/comp367-lab2-webapp.war /usr/local/apache-tomcat-9.0.52/webapps/
# COPY target/comp367-lab2-webapp /usr/local/apache-tomcat-9.0.52/webapps/
# COPY /usr/local/apache-tomcat-9.0.52/webapps/comp367-lab2-webapp/target/comp367-lab2-webapp/. /usr/local/apache-tomcat-9.0.52/webapps/  

RUN mkdir -p /usr/local/apache-tomcat-9.0.52/webapps/comp367-lab3-webapp
COPY ./target/comp367-lab2-webapp /usr/local/apache-tomcat-9.0.52/webapps/comp367-lab3-webapp/

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat server using the correct path
CMD ["/usr/local/apache-tomcat-9.0.52/bin/catalina.sh", "run"]
