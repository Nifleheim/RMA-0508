FROM nginx:alpine3.17

ENV HTTP_PORT=80 \
    REVERSE_HOST=http://info.cern.ch/

RUN mkdir -p /etc/nginx/custom_conf

COPY default.conf /etc/nginx/custom_conf/

WORKDIR /etc/nginx/custom_conf

COPY testrma.sh /testrma.sh

RUN chmod +x /testrma.sh

EXPOSE 80

ENTRYPOINT ["/testrma.sh"]



