#!/bin/bash

ACME_DIR=/home/ashleigh/.acme.sh/nc.innofox.com_ecc/
CERT_DIR=/home/ashleigh/docker/nginx-proxy/certs/

echo " >> Requesting new certs.."
/home/ashleigh/.acme.sh/acme.sh --cron --home /home/ashleigh/.acme.sh

echo " >> Copying certs to nginx.."
cp $ACME_DIR/fullchain.cer $CERT_DIR/nc.innofox.com.crt
cp $ACME_DIR/nc.innofox.com.key $CERT_DIR/nc.innofox.com.key

echo " >> Finished"
