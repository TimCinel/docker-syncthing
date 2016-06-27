FROM tianon/syncthing:latest

USER root
RUN deluser user
RUN apk add --no-cache su-exec

ENV ENTRYPOINT_SCRIPT /usr/local/bin/entrypoint.sh
ADD entrypoint.sh ${ENTRYPOINT_SCRIPT}
RUN chmod u+x ${ENTRYPOINT_SCRIPT}

RUN mkdir -p /etc/nginx/locations.d/timcinel/
ADD nginx-location.conf /etc/nginx/locations.d/timcinel-public/location.conf

EXPOSE 22000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["syncthing"]
