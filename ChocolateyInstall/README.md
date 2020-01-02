Install [chocolatey](https://chocolatey.org/)
   
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
```

Update everything already installed

```{ps1}
choco upgrade all -y
```

Common tools I use

* Programming languages

```{ps1}
choco install python3  -y
choco install r.project -y
choco install rtools -y
```

* File Access

```{ps1}
choco install filezilla -y
choco install microsoftazurestorageexplorer -y
choco install git.install -y
choco install rdcman -y
```

* Utils

```{ps1}
choco install adobereader -y
choco install 7zip.install -y
choco install notepadplusplus.install -y
choco install winmerge -y
choco install postman -y
```

* IDEs

```{ps1}
choco install r.studio -y
choco install pandoc -y
choco install ssms -y
choco install vscode -y
refreshenv
code --install-extension ms-python.python
```

* Comunication

```{ps1}
choco install microsoft-teams -y
```
