TRAN_RUNTIME_PW=$1


sql=$(sed "s/\TRAN_RUNTIME_PW/$TRAN_TIME_PW/" transaction_log.sql)
psql -U postgres -h database-1.c1lhknn6bc0m.eu-west-2.rds.amazonaws.com -w -d postgres <<EOF
$sql
EOF