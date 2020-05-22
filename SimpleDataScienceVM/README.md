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
   7. Read the "Terms and Conditions", check "I agree to the terms...", then click "Purchase"
   8. Watch the progress or just wait for the toast in the upper right hand corner
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
5. Install your [Data Science tools](#tools).
   The exact list of tools will vary depending on your needs.
   I devolop in Python _AND_ R _AND_ SQL depending on the project sponsor's requirements.
   [This](https://github.com/markanewman/DoTheThing/tree/master/ChocolateyInstall) is a list I commonly use.
   Below is subset list tuned for R.
   1. Click the windows button, type in "powersh", verify that "Windows PowerShell" is selected, then click "Run as administrator"
   2. Run the script below
   ```{ps1}
   if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   refreshenv
   choco install r.project -y
   choco install r.studio -y
   choco install rtools -y
   choco install pandoc -y
   ```
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

<a name="tools" />
Data Science Tools

![Screenshot](tools-1.jpg?raw=true)
