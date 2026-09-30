# Crea laboratorio-offline.html a partire da index.html:
# incorpora three.js r128 e i caratteri (solo sottoinsieme latin) in un unico file che funziona senza internet.
# Uso (da PowerShell, nella cartella del repository):  powershell -ExecutionPolicy Bypass -File tools\crea-offline.ps1
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$h = [IO.File]::ReadAllText((Join-Path $root 'index.html'), [Text.Encoding]::UTF8)

$three = (Invoke-WebRequest -UseBasicParsing 'https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js').Content

$m = [regex]::Match($h, '<link rel="stylesheet" href="(https://fonts\.googleapis\.com/[^"]+)">')
$ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36'
$css = (Invoke-WebRequest -UseBasicParsing -Uri $m.Groups[1].Value.Replace('&amp;','&') -UserAgent $ua).Content
$fonts = New-Object Text.StringBuilder
foreach ($b in [regex]::Matches($css, '/\* latin \*/\s*@font-face\s*\{[^}]+\}')) {
  $u = [regex]::Match($b.Value, 'url\((https://[^)]+\.woff2)\)').Groups[1].Value
  $b64 = [Convert]::ToBase64String((Invoke-WebRequest -UseBasicParsing -Uri $u).Content)
  [void]$fonts.AppendLine($b.Value.Replace($u, "data:font/woff2;base64,$b64"))
}

$h = [regex]::Replace($h, '<link rel="preconnect"[^>]*>\r?\n', '')
$h = [regex]::Replace($h, '<link rel="stylesheet" href="https://fonts\.googleapis\.com/[^"]+">', { param($x) "<style>`n/* caratteri inclusi per l'uso offline (SIL Open Font License) */`n" + $fonts.ToString() + "</style>" })
$tag = '<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>'
$h = $h.Replace($tag, "<script>/* three.js r128 - MIT License - https://threejs.org */`n" + $three + "`n</script>")
[IO.File]::WriteAllText((Join-Path $root 'laboratorio-offline.html'), $h, (New-Object Text.UTF8Encoding($false)))
Write-Output ("Creato laboratorio-offline.html (" + [math]::Round($h.Length/1024) + " KB)")
