FROM eclipse-temurin:17-alpine

RUN addgroup -g 1028 devopsc /
	&& adduser -D -G devopsc admin
 
VOLUME /tmp

ARG JAR_FILE

ARG DB_PASSWORD

ENV DB_PASSWORD=$DB_PASSWORD

COPY $(JAR_FILE) /tmp/app.jar

RUN chown -R admin:devopsc /tmp

USER admin

ENTRYPOINT ["java","-jar","/tmp/app.jar"]
