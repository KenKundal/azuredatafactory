param
(
[string]$azuresqlserver,
[string]$sqldw,
[string]$salesdevpath,
[string]$salesmgrpath,
[string]$sqlcmdpath="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
)

# run adhocquery
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U salesreport -P Dwh@1234 -i $salesdevpath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              

# wait for 5 seconds
start-sleep -Seconds 5

# run a new instance of adhoc query
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U salesreport -P Dwh@1234 -i $salesdevpath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              

# wait for 5 seconds
start-sleep -Seconds 5

#run a new instance of salesreport
Start-Process -ArgumentList "-S $azuresqlserver.database.windows.net -d $sqldw -U salesreport -P Dwh@1234 -i $salesmgrpath -I " `
              -FilePath $sqlcmdpath `
              -WindowStyle Hidden `
              
