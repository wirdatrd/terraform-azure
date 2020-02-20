

Get-AzRoleAssignment | Where-Object {$_.RoleDefinitionName -like "*peering*"} | Remove-AzRoleAssignment -Verbose 

Get-AzRoleDefinition  | Where-Object {$_.Name -like "*peering*"} | Remove-AzRoleDefinition -Verbose -Force
