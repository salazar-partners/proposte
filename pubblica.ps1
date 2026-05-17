# Uso: .\pubblica.ps1 -azienda reverseHR -file "C:\Users\sonys\Downloads\key2people-workflows\proposta-reverseHR.html"
param(
    [Parameter(Mandatory)][string]$azienda,
    [Parameter(Mandatory)][string]$file
)

$gh  = "C:\Program Files\GitHub CLI\gh.exe"
$git = "C:\Program Files\Git\bin\git.exe"
$repo = "C:\Users\sonys\Downloads\proposte"

$dest = Join-Path $repo $azienda
New-Item -ItemType Directory -Force $dest | Out-Null
Copy-Item $file (Join-Path $dest "index.html") -Force

Set-Location $repo
& $git add .
& $git commit -m "Proposta $azienda"
& $git push

Write-Host ""
Write-Host "LINK: https://salazar-partners.github.io/proposte/$azienda/" -ForegroundColor Green
