choco list -lo -r -y | foreach { "choco install $($_.SubString(0, $_.IndexOf("|"))) -y" } | Tee -FilePath "$PSScriptRoot\Install-APPS.ps1"

