Import-Module .\Module.Main.psm1
Initialize-Configuration -CinfigFile "Configuration.Main.xml"

#https://msdn.microsoft.com/library/c166ecdd-7f93-4bbb-b543-2687992dd2bc.aspx

$ssa = Get-SPEnterpriseSearchServiceApplication
$owner = Get-SPenterpriseSearchOwner -Level ssa

function Add-NewSPEnterpriseSearchRankingModel ()
{
	$newRankingModelXml = [String] Get-Content .\Configuration.RankingModel.xml
	$newRankingModel = New-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner -RankingModelXML $newRankingModelXml
}

function Export-SPDefaultRankingModel()
{
	$defaultRankingModel = Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner | Where-Object { $_.IsDefault -eq $True }
	$defaultRankingModel.RankingModelXML > Exported.DefaultRankingModel.xml
}

function Export-SPRankingModel($rankingModelId)
{
	$rankingModel = Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner Identity $rankingModelGuid 
	$rankingModel.RankingModelXML > Exported.RankingModel.xml
}