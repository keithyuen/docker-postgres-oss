#!/bin/sh

CERT_DIR="/certs"
KEY_FILE="$CERT_DIR/server.key"
CRT_FILE="$CERT_DIR/server.crt"

mkdir -p "$CERT_DIR"

if [ ! -f "$KEY_FILE" ] || [ ! -f "$CRT_FILE" ]; then
  echo "Generating self-signed certificate..."
  openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
    -keyout "$KEY_FILE" -out "$CRT_FILE" \
    -subj "/C=SG/ST=NA/L=Singapore/O=MyOrg/CN=localhost"
  chmod 600 "$KEY_FILE"
else
  echo "SSL certificate already exists. Skipping generation."
fi