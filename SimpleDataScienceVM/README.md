# Simple Data Science VM

Walkthrough to understand how to get a VM setup fast

## Prerequisites

* [Azure](https://portal.azure.com) Account

## Steps

1. Create a [new Resource Group](#resource-group)
   1. Log into Azure
   2. Click the hamberger icon (3 horizontal lines) in the upper left of the screen
   3. Click "All Services", then "Resource groups"
   4. Click "Add", then name your resource group
   5. Click "Review + create", then "Create"
   6. Wait for the toast in the upper right hand corner
   7. [Optional] Pin the new resource group to your dashboard using the pin button in the upper right of the screen
2. Deploy the [attached template](#deploy-template)
   1. Navigate to the resource group
   2. Click "Overview", then "Add"
   3. In the search box, type "temp", then select "Template deployment (deploy using custom templates)" from the quick options.
   4. Click "Create", then "Build your own template in the editor"
   5. Paste in the [attached template](./template.json) and click "Save"
   6. In the "Settings" section, fill out the VM Name, User Name, Password, and My Ip values.
      * VM name must be 5-10 lowercase alphanumeric and start with a letter
      * Don't do something stupid with your username/password
      * Your "My Ip" Can be found [here](https://whatismyipaddress.com/)
   7. Watch the progress or just wait for the toast in the upper right hand corner
3. [RDP](#rdp) into new VM
   1. Select the VM inside the resource group
   2. Click "Overview", then "Connect", then "RDP", then "Download file"
   3. Double click on the downloaded file, then click "Connect"
   4. Enter your username/password and click "Ok". If it is prompting you for your _work or school_ credentails, select "More Choices", then "Use a different account"
4. [Update Windows](#update-windows)
   1. Click the Windows button, then type "update", then click "Check for Updates"
   2. Click "Check for Updates" even if it reports "No updates available".
      Keep re-checking and re-starting windows until this comes up "You'er up to date" AND there is a last checked date AND you click the button one last time.
      A lot of patched cannot be installed until another patch was installed 1st.

## Cleanup

AutoShutdown is turned off to prevent long running simulations from closing without knoledge.
Make sure you delete your resources after you are done to avoid excess charge.

## Images

<a name="resource-group" />
Create Resource Group

![Screenshot](resource-group-1.jpg?raw=true)
![Screenshot](resource-group-2.jpg?raw=true)
![Screenshot](resource-group-3.jpg?raw=true)
![Screenshot](resource-group-4.jpg?raw=true)
![Screenshot](resource-group-5.jpg?raw=true)
![Screenshot](resource-group-6.jpg?raw=true)
![Screenshot](resource-group-7.jpg?raw=true)

<a name="deploy-template" />
Deploy ARM Template

![Screenshot](deploy-template-1.jpg?raw=true)
![Screenshot](deploy-template-2.jpg?raw=true)
![Screenshot](deploy-template-3.jpg?raw=true)
![Screenshot](deploy-template-4.jpg?raw=true)
![Screenshot](deploy-template-5.jpg?raw=true)
![Screenshot](deploy-template-6.jpg?raw=true)

<a name="rdp" />
RDP

![Screenshot](rdp-1.jpg?raw=true)
![Screenshot](rdp-2.jpg?raw=true)
![Screenshot](rdp-3.jpg?raw=true)

<a name="update-windows" />
Update Windows

![Screenshot](update-windows-1.jpg?raw=true)
![Screenshot](update-windows-2.jpg?raw=true)
![Screenshot](update-windows-3.jpg?raw=true)



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


