FROM supabase/postgres:15.1.1.2

COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./schema.sql /schema.sql

# Run SQL script on startup
ENTRYPOINT ["docker-entrypoint.sh"]
