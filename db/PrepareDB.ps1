$defaultHost = 'localhost'
$DB_SERVER = Read-Host "Specify Postgres running host [$($defaultHost)]"
$DB_SERVER = ($defaultHost,$DB_SERVER)[[bool]$DB_SERVER]

$defaultUser = 'postgres'
$DB_USER = Read-Host "Specify Postgres user [$($defaultUser)]"
$DB_USER = ($defaultUser,$DB_USER)[[bool]$DB_USER]

$DB_PWD = Read-Host -assecurestring "Specify Postgres password"
$DB_PWD = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($DB_PWD))

$defaultPort = 5432
$DB_PORT = Read-Host "Specify Postgres Running Port [$($defaultPort)]"
$DB_PORT = ($defaultPort,$DB_PORT)[[bool]$DB_PORT]

$host1 = "-h$DB_SERVER"
$user = "-U$DB_USER"
$port = "-p$DB_PORT"
$dbname = "-dtest"

$env:PGPASSWORD = $DB_PWD;

psql $host1 $port $user -f './create_db.sql'

# $vuser = "-Uvento"
$vuser = "-U$DB_USER"
psql $host1 $port $vuser $dbname -f './create_table_department.sql'

psql $host1 $port $vuser $dbname -f './create_table_user.sql'

psql $host1 $port $vuser $dbname -f './insert_seed_dept.sql'

psql $host1 $port $vuser $dbname -f './insert_seed_user.sql'