
FROM tomcat:10.1.13

#/usr/local/tomcat/webapps/ROOT/SWE645-Ast1.war
COPY SWE645-Ast1.war /usr/local/tomcat/webapps/

# Expose port 8080 (default Tomcat port)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
