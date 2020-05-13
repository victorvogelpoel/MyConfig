

function Extract-PackageReference
{
    [CmdletBinding()]
    param
    (
        [Parameter(mandatory=$true, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('PSPAth', 'Fullname')]
        [string[]]$CSProjFile 
    )

    process
    {
        [xml]$projxml = Get-Content -LiteralPath $CSProjFile

        foreach ($packageReference in $projxml.Project.ItemGroup.PackageReference)
        {
            if (!([String]::IsNullOrEmpty($packageReference.Include)))
            {
                [PSCustomObject]@{
                    'Package' = $packageReference.Include
                    'Version' = $packageReference.Version
                }
            }
        }
    }
}


# Extract-PackageReference -CSProjFile 'C:\PROJECTS\TheOne.LAB.ChrisLoggingwithSerilog\src\TheOne.LAB.ChrisLoggingwithSerilog\TheOne.LAB.ChrisLoggingwithSerilog.csproj'


get-childitem -LiteralPath 'C:\PROJECTS'          -Filter *.csproj -Recurse | Extract-PackageReference | sort -Unique Package > (Join-Path $PSScriptRoot 'PROJECTS-nugetlist.txt')
get-childitem -LiteralPath 'C:\PROJECTS-PERSONAL' -Filter *.csproj -Recurse | Extract-PackageReference | sort -Unique Package > (Join-Path $PSScriptRoot 'PROJECTS-PERSONAL-nugetlist.txt')

