#!/bin/bash
aws lightsail create-domain-entry \
    --region us-east-1 \
    --domain-name miseso.com \
    --domain-entry name=miseso.com,type=A,target=18.133.85.111
