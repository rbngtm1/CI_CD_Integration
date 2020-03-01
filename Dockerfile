
FROM tomcat:8.5.16-jre8-alpine
# Take the war and copy to webapps of tomcat.
# COPY . .
CMD ["catalina.sh","run"]