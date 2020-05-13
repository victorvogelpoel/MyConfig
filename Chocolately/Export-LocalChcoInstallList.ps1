choco list -lo -r -y | foreach { "choco install $($_.SubString(0, $_.IndexOf("|"))) -y" } | Out-File (Join-Path $PSSCriptRoot 'Install-APPS.ps1')

