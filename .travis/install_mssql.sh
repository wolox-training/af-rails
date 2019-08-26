docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=wbooks-api' -p 1433:1433 -d --name sqlserver2 mcr.microsoft.com/mssql/server:2017-latest

#export PYMSSQL_BUILD_WITH_BUNDLED_FREETDS=1
#pip install pymssql

#export WBOOKS_TEST_DB_URI="${ORANGE_TEST_DB_URI}|mssql://SA:wbooks-api@127.0.0.1:1433"

