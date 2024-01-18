#!/bin/bash

docker build -t tribehealth/affine-supabase-db:v0.1.2 .
docker push tribehealth/affine-supabase-db:v0.1.2
