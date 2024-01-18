#!/bin/bash

docker build -t tribehealth/affine-supabase-db:v0.1.3 .
docker push tribehealth/affine-supabase-db:v0.1.3
