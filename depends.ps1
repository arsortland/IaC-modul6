# $tenantid = "02feabb9-444e-4f66-9c13-6a8f04b75c2f"
# $subscriptionsid = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
# $credentials = Get-Credential
# Connect-AzAccount -ServicePrincipal -Credential $credentials -TenantId $tenantid -Environment AzureCloud -SubscriptionId $subscriptionsid

$rg  ="iac-demo-rg-drey"
New-AzResourceGroup -Name $rg -Location "West Europe" -Force

New-AzResourceGroupDeployment `
    -Name "new-dependstest-iac-demo" `
    -ResourceGroupName $rg `
    -TemplateFile '.\arm-depends.json' `
    -TemplateParameterFile '.\arm-depends.parameters.json'