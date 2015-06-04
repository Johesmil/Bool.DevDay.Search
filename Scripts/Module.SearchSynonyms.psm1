Import-Module .\Module.Main.psm1
LoadConfiguration -ConfigFile "Configuration.Main.xml"

function Install-SPSynonyms() {
	$searchApp = Get-SPEnterpriseSearchServiceApplication 
	Import-SPEnterpriseSearchThesaurus -SearchApplication $searchApp -Filename $global:SearchSynonymsThesaurusPath
}