$Parameters = @{
	Uri             = "https://api.github.com/repos/farag2/Sophia-Script-for-Windows/releases/latest"
	UseBasicParsing = $true
}
$LatestGitHubRelease = (Invoke-RestMethod @Parameters).tag_name

$Parameters = @{
	Uri             = "https://raw.githubusercontent.com/farag2/Sophia-Script-for-Windows/master/sophia_script_versions.json"
	UseBasicParsing = $true
}
$JSONVersions = Invoke-RestMethod @Parameters

$Parameters = @{
	Uri             = "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/$LatestGitHubRelease/SHA256SUM"
	OutFile         = "Scripts\SHA256SUM"
	UseBasicParsing = $true
}
Invoke-WebRequest @Parameters

$SHA256SUM = Get-Content -Path "Scripts\SHA256SUM" -Encoding UTF8

$LatestRelease = $JSONVersions.Sophia_Script_Windows_10_LTSC2019
$Windows10LTSC2019 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.10.LTSC.2019.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_10_LTSC2021
$Windows10LTSC2021 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.10.LTSC.2021.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_10_PowerShell_7
$Windows10PS7 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.10.PowerShell.7.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_10_PowerShell_5_1
$Windows10 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.10.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_11_LTSC2024
$Windows11LTSC2024 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.11.LTSC.2024.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_11_PowerShell_7
$Windows11PS7 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.11.PowerShell.7.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

$LatestRelease = $JSONVersions.Sophia_Script_Windows_11_PowerShell_5_1
$Windows11 = (($SHA256SUM | Where-Object -FilterScript {$_ -match "Sophia.Script.for.Windows.11.v$LatestRelease.zip"}).Split(" ") | Select-Object -Last 1).Trim()

echo "Windows10LTSC2019=$Windows10LTSC2019" >> $env:GITHUB_ENV
echo "Windows10LTSC2021=$Windows10LTSC2021" >> $env:GITHUB_ENV
echo "Windows10PS7=$Windows10PS7" >> $env:GITHUB_ENV
echo "Windows10=$Windows10" >> $env:GITHUB_ENV
echo "Windows11LTSC2024=$Windows11LTSC2024" >> $env:GITHUB_ENV
echo "Windows11PS7=$Windows11PS7" >> $env:GITHUB_ENV
echo "Windows11=$Windows11" >> $env:GITHUB_ENV
