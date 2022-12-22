#Variable for SharePoint Online Admin Center URL
#Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select Name,Version 
Install-Module Microsoft.Online.SharePoint.PowerShell
#Import-Module Microsoft.Online.SharePoint.PowerShell
$AdminSiteURL="https://<Tenant name>-admin.sharepoint.com"
$CSVFile = "C:\Temp\OneDrives.csv"
  
#Connect to SharePoint Online Admin Center
Connect-SPOService -Url $AdminSiteURL -credential (Get-Credential)
 
#Get All OneDrive Sites usage details and export to CSV
Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "Url -like '-my.sharepoint.com/personal/'" | Select URL, Owner, StorageQuota, StorageUsageCurrent, LastContentModifiedDate | Export-Csv -Path $CSVFile -NoTypeInformation
