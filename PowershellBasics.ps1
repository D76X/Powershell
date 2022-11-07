# Check the version of PS in the session
# read-only hash table that displays details about the version of PowerShell that is running in the current session.
$PSVersionTable

# How to install PS on Windows
# https://learn.microsoft.com/en-us/shows/it-ops-talk/how-to-install-powershell-7
# https://www.thomasmaurer.ch/2019/07/how-to-install-and-update-powershell-7/
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"

# How to install PS on Linux
wget https://aka.ms/install-powershell.sh; sudo bash install-powershell.sh; rm install-powershell.sh


# Check the installed PS modules
# https://learn.microsoft.com/en-us/powershell/module/powershellget/get-installedmodule?view=powershell-7.2
Get-InstalledModule
Get-Module -Name AzureRM -ListAvailable -All

# How to migrate from AzureRM to Az in Azure PowerShell
# https://azure.microsoft.com/en-gb/blog/how-to-migrate-from-azurerm-to-az-in-azure-powershell/
# https://learn.microsoft.com/en-us/powershell/azure/migrate-from-azurerm-to-az?view=azps-9.1.0

# The module Az and AzureRM cannot coexist on the same system!
# You must get rid of AzureRM and migrate to Az.
# Once installed PS 7.x LTS you have to run these two cmdlets in both session.
# Furthermore, the latter unistall cmdlet requires admin elevation and is provided by the Az module
# itself. For this reason the two steps must be performed in the order install Az > Uninstall AzureRm.
# PS PS 7.x LTS
# PS < 7.x LTS
Install-Module -Name Az -AllowClobber -Scope CurrentUser
Uninstall-AzureRm