FROM openjdk:12-alpine


ARG JAVA_OPTS
ARG JAR_FILE=target/social-chat.jar

RUN apt-get update && \
	apt-get install -y --no-install-recommends bash gawk sed grep bc coreutils tzdata && \
	rm -rf /var/lib/apt/lists/*

RUN addgroup --system ay && \
	adduser --system --ingroup ay ay


RUN mkdir /app

COPY ${JAR_FILE} /app/app.jar
RUN chown ay:ay /app/app.jar
COPY entrypoint.sh /

RUN chown ay:ay /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
CMD ["/entrypoint.sh"]
