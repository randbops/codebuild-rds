TRAN_RUNTIME_PW=$1
HOST='database-1.c1lhknn6bc0m.eu-west-2.rds.amazonaws.com'
DATABASE='postgres'
SQL_FILE='transaction_log.sql'

sql=$(sed "s/\TRAN_RUNTIME_PW/$TRAN_RUNTIME_PW/" $SQL_FILE)
psql -U postgres -h $HOST -w -d $DATABASE <<EOF
$sql
EOF
echo $sql