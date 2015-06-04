Import-Module .\Module.Main.psm1
Initialize-Configuration -ConfigFile "Configuration.Main.xml"

function Export-SPWebSearchConfiguration($webUrl) {
	$web = Get-SPWeb $webUrl;
	$searchConfig = New-Object Microsoft.Office.Server.Search.Portability.SearchConfigurationPortability($web.Site)
	$owner = New-Object Microsoft.Office.Server.Search.Administration.SearchObjectOwner([Microsoft.Office.Server.Search.Administration.SearchObjectLevel]::SPWeb, $web)
	$searchConfig.ExportSearchConfiguration($owner) | Out-File -FilePath "Export-SPWebSearchConfiguration.xml"
}

function Import-SPWebSearchConfiguration($webUrl, $configFilePath) {
	$web = Get-SPWeb $webUrl;
	$searchConfig = New-Object Microsoft.Office.Server.Search.Portability.SearchConfigurationPortability($web.Site)
	$owner = New-Object Microsoft.Office.Server.Search.Administration.SearchObjectOwner([Microsoft.Office.Server.Search.Administration.SearchObjectLevel]::SPWeb, $site.OpenWeb())
	$configuration = Get-Content $configFilePath
	$searchConfig.ImportSearchConfiguration($owner, $configuration) 
}