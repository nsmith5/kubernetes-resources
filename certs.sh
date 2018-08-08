#!/bin/bash
mkdir -p -f letsencrypt/{logs,config/work}
certbot certonly \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --manual --preferred-challenges dns \
    -d '*.nfsmith.ca' \
    --work-dir letsencrypt/work --config-dir letsencrypt/config/ \
    --logs-dir letsencrypt/logs/