Import-Module .\Module.Main.psm1
LoadConfiguration -CinfigFile "Configuration.Main.xml"

#https://msdn.microsoft.com/library/c166ecdd-7f93-4bbb-b543-2687992dd2bc.aspx

	#Get available ranking models
	$ssa = Get-SPEnterpriseSearchServiceApplication -Identity "Search Service Application"
	$owner = Get-SPenterpriseSearchOwner -Level ssa
	Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner	
	
	#Retrieve a default ranking model to use as a template
	$ssa = Get-SPEnterpriseSearchServiceApplication
	$owner = Get-SPenterpriseSearchOwner -Level ssa
	$defaultRankingModel = Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner | Where-Object { $_.IsDefault -eq $True }
	$defaultRankingModel.RankingModelXML > CustomRankingModel.xml

	#Retrieve search ranking model to use as template
	$ssa = Get-SPEnterpriseSearchServiceApplication 
	$owner = Get-SPenterpriseSearchOwner -Level ssa 
	$twoLinearStagesRankingModel = Get-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner -Identity 5E9EE87D-4A68-420A-9D58-8913BEEAA6F2 
	$twoLinearStagesRankingModel.RankingModelXML > CustomRankingModel.xml

	#Copy template ranking model
	$ssa = Get-SPEnterpriseSearchServiceApplication
	$owner = Get-SPenterpriseSearchOwner -Level ssa
	$rm = Get-SPEnterpriseSearchRankingModel -Identity 8f6fd0bc-06f9-43cf-bbab-08c377e083f4 -SearchApplication $ssa -Owner $owner
	$rm.RankingModelXML > myrm.xml
	
	#Create new ranking model
	$myRankingModel = Get-Content .\myrm.xml 
	$myRankingModel = [String]$myRankingModel
	$ssa = Get-SPEnterpriseSearchServiceApplication
	$owner = Get-SPenterpriseSearchOwner -Level ssa
	$newrm = New-SPEnterpriseSearchRankingModel -SearchApplication $ssa -Owner $owner -RankingModelXML $myRankingModel