FROM alpine:latest

RUN apk add --no-cache openssl

COPY generate-cert.sh /usr/local/bin/generate-cert.sh
RUN chmod +x /usr/local/bin/generate-cert.sh

ENTRYPOINT ["sh", "/usr/local/bin/generate-cert.sh"]