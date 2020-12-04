function backup-vds {
#backup VDS from connected VCenter
$switch = $(Get-VDSwitch)
$date = $((Get-Date).ToString('yyyy-MM-dd'))
Foreach ($i in $switch) {
md "C:\Backups\Switch\backup_$date\$i"
Get-VDSwitch -Name $i | Get-VDPortgroup | Foreach {
Export-VDPortGroup -VDPortGroup $_ -Destination “C:\Backups\Switch\backup_$date\$i\$($_.Name).Zip”
}
}
}
 
#Connect to the first vCenter
$VIServer1 = "vcenter_FQDN"
$VIUser1 = "administrator@vsphere.local"
$VIPass1 = "***"
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -server $VIServer1 -user $VIUser1 -pass $VIPass1
#call function
backup-vds
 
#Connect to the second vCenter
$VIServer2 = "vcenter_FQDN"
$VIUser2 = "administrator@vsphere.local"
$VIPass2 = "***"
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -server $VIServer2 -user $VIUser2 -pass $VIPass2
#call function
backup-vds
