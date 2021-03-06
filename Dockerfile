FROM alpine:3

ENV CONSUL_TEMPLATE_VERSION 0.24.1

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
  mv consul-template /usr/local/bin/consul-template &&\
  rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
  apk add --no-cache curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]
