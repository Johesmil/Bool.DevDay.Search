Import-Module .\Module.Main.psm1

function ListRankings()
{
	$ssa = Get-SPEnterpriseSearchServiceApplication -Identity "Search Service Application";
	$owner = Get-SPenterpriseSearchOwner -Level ssa;
	$list = Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner;
}

