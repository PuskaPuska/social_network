FROM openjdk:12-alpine

ARG JAVA_OPTS
ARG JAR_FILE=social-backend/target/social-backend.jar
ARG STATIC_DIST=social-frontend/dist/social-frontend

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash gawk sed grep bc coreutils tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y nginx && mkdir -p /run/nginx

RUN addgroup --system ay && \
    adduser --system --ingroup ay ay

RUN mkdir /www && mkdir /app
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/

RUN chown -R ay:ay /var/lib/nginx && \
    chown -R ay:ay /www && \
    chown -R ay:ay /app && \
    touch /run/nginx/nginx.pid && \
    chown -R ay:ay /run/nginx/nginx.pid && \
    mkdir /var/cache/nginx && \
    chown -R ay:ay /var/cache/nginx && \
    chown -R ay:ay /var/tmp/nginx && \
    chown -R ay:ay /var/log/nginx

COPY ${STATIC_DIST}/ /www/
COPY ${JAR_FILE} /app/app.jar
RUN chown ay:ay /app/app.jar
COPY entrypoint.sh /

RUN chown ay:ay /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
CMD ["/entrypoint.sh"]
