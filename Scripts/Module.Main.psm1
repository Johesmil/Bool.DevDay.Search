if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) {
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

#region Configuration
function LoadConfiguration($ConfigFile)
{
	Write-Init "Loading configuration..."
	[xml]$XmlConfiguration = (Get-Content .\$ConfigFile)

	$global:SearchServiceApplicationName = $XmlConfiguration.Configuration.ServiceApplications.MetadataServiceApplication.Name
	$global:SearchCenterUrl = $XmlConfiguration.Configuration.SearchCenter.Url
	Write-Success "Configuration loaded"
}
#endregion Configuration

#region Logging
$dateString = (Get-Date -Format yyMMdd-HHmmss).ToString();
$global:logFileName = "Log-$dateString.txt";

function Write-Log($message, $foregroundColor)
{
	Write-Host $message -ForegroundColor $foregroundColor;
	$message | Out-File "./$global:logFileName" -Append;
}

function Write-Message($message)
{
	Write-Host $message;
	$message | Out-File "./$global:logFileName" -Append;
}

function Write-Success($message)
{
	Write-Host $message -ForegroundColor green;
	$message | Out-File "./$global:logFileName" -Append;
}

function Write-Init($message)
{
	Write-Host $message -ForegroundColor cyan;
	$message | Out-File "./$global:logFileName" -Append;
}

function Write-Warning($message)
{
	Write-Host $message -ForegroundColor yellow;
	$message | Out-File "./$global:logFileName" -Append;
}

function Write-Error($message)
{
	Write-Host $message -ForegroundColor red;
	$message | Out-File "./$global:logFileName" -Append;
}
#endregion Logging