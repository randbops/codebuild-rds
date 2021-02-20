ROLE_PASSWORD=$1
HOST='database-1.c1lhknn6bc0m.eu-west-2.rds.amazonaws.com'
DATABASE='postgres'
SQL_FILE='transaction_runtime.sql'

sql=$(sed "s/\ROLE_PASSWORD/$ROLE_PASSWORD/" $SQL_FILE)
psql -U postgres -h $HOST -w -d $DATABASE <<EOF
$sql
EOF
echo $sql