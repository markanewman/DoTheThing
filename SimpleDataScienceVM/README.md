# Simple Data Science VM

Walkthrough to understand how to get a VM setup fast

## Prerequisites

* [Azure](https://portal.azure.com) Account

## Steps

1. Run the below PowerShell script.
   The directory will need to be adjusted to be in wherever the `template.json` is located.

```{ps1}
Login-AzureRmAccount

$resourceGroupName = 'PythonDataScience'
$resourceGroupLocation = 'eastus'
$config = @{ vmName = ''; userName = ''; password = '' }

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
New-AzureRMResourceGroupDeployment -verbose -ResourceGroupName $resourceGroupName -Mode 'Incremental' -TemplateFile 'template.json' -config $config
```

2. Setup the NSG to allow RDP access to where you login
   Source IP + Destination port (3389) + Protocol (TCP) + Action (Allow).
   **NOTE:** this is not the most secure you can get.
   Please consider a proper VNet
3. Update the "Virus & threat protection" settings
4. Run the "Check for Updates".
   Remember to re-run until no updates are found.
   A lot of patched cannot be installed until another patch was installed 1st.
   Restarts may be required.
5. RDP into the VM and install the below from an admin Powershell
   * [Chocolatey](https://chocolatey.org/install)     
   * [Python](https://www.python.org/downloads/windows/)
   * [R](https://cran.r-project.org/bin/windows/base/)
   * [Git](https://gitforwindows.org/)
   * [Notepad++](https://notepad-plus-plus.org/download)
   * [7-zip](https://www.7-zip.org/)
   * [FileZilla](https://filezilla-project.org/download.php)
   * [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)
   * [VS Code](https://code.visualstudio.com/Download) along with the below plugins
     * Python by Microsoft.
	   Set the option Python >> Data Science: Send Selection To Interactive Window
   * [R Studio](https://www.rstudio.com/products/rstudio/download/)
   * [RTools](https://cran.r-project.org/bin/windows/Rtools/)
   * [Pandoc](https://pandoc.org)
   * [SSMS](https://docs.microsoft.com/en-us/sql/ssms/sql-server-management-studio-ssms)
   
   ```{ps1}
   if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   refreshenv

   choco install python3  -y
   choco install r.project -y
   choco install git.install -y
   choco install notepadplusplus.install -y
   choco install 7zip.install -y
   choco install filezilla -y
   choco install microsoftazurestorageexplorer -y   
   choco install vscode -y
   refreshenv

   code --install-extension ms-python.python
   choco install r.studio -y
   choco install rtools -y
   choco install pandoc -y

   choco install ssms -y
   ```
6. On the data disk, make a file share called "shared".
   Resource group >> storage account >> Files (left hand side) >> Add
7. Copy the "Connect AS" information and run it in the VM.
   Use Drive "S"


