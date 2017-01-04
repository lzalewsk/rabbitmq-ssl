FROM rabbitmq:3-management
MAINTAINER luka <lzalewsk@gmail.com>

ENV RABBITMQ_DEFAULT_USER=guest \
    RABBITMQ_DEFAULT_PASS=guest \
    RABBITMQ_DEFAULT_VHOST=/ \
    RABBITMQ_SSL_CERT_FILE=/etc/rabbitmq/ssl/cert.pem \
    RABBITMQ_SSL_KEY_FILE=/etc/rabbitmq/ssl/key.pem \
    RABBITMQ_SSL_CA_FILE=/etc/rabbitmq/ssl/cacert.pem

# set erlang cookie if desired
# https://www.rabbitmq.com/clustering.html
# ENV RABBITMQ_ERLANG_COOKIE=

# copy ssl keys and set rabbitmq to use them
COPY ssl/* /etc/rabbitmq/ssl/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/ssl/* \
    && chmod 400 /etc/rabbitmq/ssl/*
