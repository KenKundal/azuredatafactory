param
(
[string]$azuresqlserver,
[string]$sqldw,
[string]$adhocquerypath,
[string]$salesreportpath,
[string]$sqlcmdpath="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
)

# run adhocquery
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U adhocquery -P Dwh@1234 -i $adhocquerypath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              

# wait for 5 seconds
start-sleep -Seconds 5

# run a new instance of adhoc query
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U adhocquery -P Dwh@1234 -i $adhocquerypath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              

# wait for 5 seconds
start-sleep -Seconds 5

#run a new instance of salesreport
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U salesreport -P Dwh@1234 -i $salesreportpath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              
