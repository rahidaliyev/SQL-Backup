@echo off
SET SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
REM In server name write a actual name of server
SET SERVERNAME=SERVERNAME 
SET BACKUPDIR=D:\BackupFolder

REM Create backup directory if it doesn't exist
IF NOT EXIST %BACKUPDIR% (
    mkdir %BACKUPDIR%
)

%SQLCMD% -S %SERVERNAME% -E -Q "DECLARE @name VARCHAR(50), @fileName VARCHAR(256), @path VARCHAR(256), @datetime NVARCHAR(20); SET @path = '%BACKUPDIR%\\'; SET @datetime = REPLACE(CONVERT(VARCHAR, GETDATE(), 120), ':', '-'); DECLARE db_cursor CURSOR FOR SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb'); OPEN db_cursor; FETCH NEXT FROM db_cursor INTO @name; WHILE @@FETCH_STATUS = 0 BEGIN SET @fileName = @path + @name + '_' + @datetime + '.bak'; BACKUP DATABASE @name TO DISK = @fileName; FETCH NEXT FROM db_cursor INTO @name; END; CLOSE db_cursor; DEALLOCATE db_cursor;" 

echo Backups have been saved to %BACKUPDIR%
exit
