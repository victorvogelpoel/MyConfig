# https://alfredmyers.com/2019/05/31/how-to-copy-visual-code-extensions-to-another-machine/
# https://www.codeproject.com/Tips/4121672/How-to-Export-VS-Code-Extensions-to-Another-Comput
 
$extensions = code --list-extensions

$extensions | out-file -PSPath (Join-Path $PSScriptRoot 'vscode-extensions.txt')
$extensions | ForEach  {"code --install-extension $_"} > (Join-Path $PSScriptRoot 'Install-VSCodeExtensions.ps1')
