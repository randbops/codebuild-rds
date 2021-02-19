POSTGRESQL_PWD='seine123'
POSTGRESQL_USER='postgres'


if PGHOST=database-1.c1lhknn6bc0m.eu-west-2.rds.amazonaws.com PGPORT=5432 PGUSER=$POSTGRESQL_USER PGPASSWORD=$POSTGRESQL_PWD \
        PGDATABASE=postgres -c \q 2>/dev/null
then
    echo "[OK]"
else
    echo "[FAIL]"
fi