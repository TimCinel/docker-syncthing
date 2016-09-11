FROM tianon/syncthing:latest

USER root
RUN apk add --no-cache su-exec

ADD docker-entrypoint.sh setuidgid.inc /
ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 22000
CMD ["syncthing"]
