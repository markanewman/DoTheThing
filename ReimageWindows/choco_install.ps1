if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv

choco install "7zip;adobereader;notepadplusplus;tailscale" -y
choco install "git;vscode;docker-desktop" -y
choco install "aescrypt;filezilla" -y