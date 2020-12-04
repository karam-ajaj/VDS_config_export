Get-ChildItem “C:\Backups\Switch\backup_???\” | Foreach {
New-VDPortgroup -VDSwitch NewVDS -Name “New$($_.BaseName)” -BackupPath $_.FullName
}
