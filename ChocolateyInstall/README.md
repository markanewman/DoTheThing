# Chocolatey Install

**Updated**: 2021/08/03

> Chocolatey is a software management solution unlike anything else you've ever experienced on Windows.
> Chocolatey brings the concepts of true package management to allow you to version things, manage dependencies and installation order, better inventory management, and other features.
> -- https://chocolatey.org/

_Most_ of the commands below require an _admin_ PowerShell prompt to run.

## Install [chocolatey](https://chocolatey.org/)

To install Chocolatey, open an _admin_ PowerShell prompt and run the following
   
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
```

## Helpful commands

* What is installed?
  ```{ps1}
  choco list -l
  ```
* What can be updated?
  ```{ps1}
  choco upgrade all -noop
  ```
* Update everything already installed.
  ```{ps1}
  choco upgrade all -y
  ```

## My list of tools

Below is a list of tools I _currently_ use.
Most are focused on data science, but there is also other things like Adobe Reader 

```{ps1}
choco install 7zip -y
choco install adobereader -y
choco install aescrypt -y
choco install filezilla -y
choco install git -y
choco install microsoft-teams -y
choco install microsoftazurestorageexplorer -y
choco install notepadplusplus -y
choco install openhardwaremonitor -y
choco install postman -y
choco install python3  -y
choco install r.project -y
choco install r.studio -y
choco install rtools -y
choco install vscode -y
choco install winmerge -y
```

**Old Tools**

```{ps1}
choco install pandoc -y
choco install sql-server-management-studio -y
choco install windirstat -y
```
