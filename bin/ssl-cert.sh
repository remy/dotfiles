#!/usr/bin/env bash

# Specify where we will install
# the $DOMAIN certificate
SSL_DIR="$HOME/certs"

# Set the wildcarded domain
# we want to use
DOMAIN=$1

# A blank passphrase
PASSPHRASE=""

# Set our CSR variables
SUBJ="
C=GB
ST=Brighton
O=
localityName=Brighton
commonName=*.$DOMAIN
organizationalUnitName=
emailAddress="

# Create our SSL directory
# in case it doesn't exist
sudo mkdir -p "$SSL_DIR"

# Generate our Private Key, CSR and Certificate
sudo openssl genrsa -out "$SSL_DIR/$DOMAIN.key" 2048
sudo openssl req -new -subj "$(echo "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.csr" -passin pass:$PASSPHRASE
sudo openssl x509 -req -days 365 -in "$SSL_DIR/$DOMAIN.csr" -signkey "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.crt"
