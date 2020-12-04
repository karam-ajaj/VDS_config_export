# A script to export all DLR configuration for multiple vCenters

Description: This script exports all the virtual distributed switches configurations and place the backup on a local location

Backup location: C:\Backups\Switch\backup_date

Script location: C:\Script\vds-bkp.ps1

# Windows Task:
* name: vds-backup
* action: powershell -ExecutionPolicy Unrestricted -File C:\Script\vds-bkp.ps1
