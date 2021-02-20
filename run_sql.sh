ROLE_PASSWORD=$4
HOST=$2
DATABASE=$3
SQL_FILE=$1

sql=$(sed "s/\ROLE_PASSWORD/$ROLE_PASSWORD/" $SQL_FILE)
psql -U postgres -h $HOST -w -d $DATABASE <<EOF
$sql
EOF
echo $sql