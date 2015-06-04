Import-Module .\Module.Main.psm1
Initialize-Configuration -ConfigFile "Configuration.Main.xml"

function Install-SPContentSources() {
	
	New-SPEnterpriseSearchCrawlContentSource -Type SharePoint -name "Content Source 1" -StartAddresses "http://sharepoint" -SharePointCrawlBehavior CrawlVirtualServers
}