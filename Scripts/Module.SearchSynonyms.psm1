Import-Module .\Module.Main.psm1
Initialize-Configuration -ConfigFile "Configuration.Main.xml"

function Install-SPSynonyms() {
	$searchApp = Get-SPEnterpriseSearchServiceApplication
	$currentLocation = Get-Location
	$filePath = "$currentLocation\$global:SearchSynonymsThesaurusPath"
	$uncpath = $filePath.Replace(":", "$").Insert(0, "\\"+$env:COMPUTERNAME+"\")
	write-host $uncPath
	Import-SPEnterpriseSearchThesaurus -SearchApplication $searchApp -Filename $uncPath
}