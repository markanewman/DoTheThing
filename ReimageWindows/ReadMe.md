# Reimage Windows

I want a nice fresh copy of Windows every now and then.
Think of it like spring cleaning.

1. Get a 8GB or more USB FlashDrive and give it a quick format.
   Make sure to lable the volume.
2. Download the Windows 11 [media creation tool](https://www.microsoft.com/software-download/windows11)
3. Make the bootable USB using the media creation tool.
   This takes a while so start it now.
4. Download the latest drivers and extract the drivers to the hard drive (`c:/working/drivers`).
   The raw `.inf` files must be present for this to work.
6. Download and run "ShowKeyPlus" from the Windows Store [1][ref_1].
7. Copy out the "ProductID".
8. Get the WiFi configuration.
   ```
   netsh.exe wlan export profile key=clear 
   ```
9. Create a `choco_install.ps1` file with all the apps you want reinstalled or use the [cached file][file_1].
11. Create and download an `autounattend.xml` file [2][ref_2] or use the [cached file][file_2].
    * **DO NOT** copy in the ProductID.
    * **DO NOT** copy in the WiFi password, use the "Configure Wi-Fi using an XML..." option.
    * **DO NOT** copy in the XML, use the contents of [`Wi-Fi-Placeholder.xml`][file_3] as a place holder.
    * In the "Scripts to run when the first user logs on after Windows has been installed" section, add the following as a `.ps1`.
      ```
      . d:/choco_install.ps1
      ```
12. Wait for the media creation tool to complete.
13. Copy `autounattend.xml` and `choco_install.ps1` to the root of the USB FlashDrive.
14. Add in the "ProductID" from step 6 and the XML from step 7 to the `autounattend.xml` file on the USB FlashDrive.
    Search for the below as a quick replace.
    * `<Key>`
    * `<WLANProfile xmlns`
16. Copy the `install.wim` file from the USB FlashDrive (`~/sources/install.wmi`) to the hard drive (`c:/working/wim/install.wim`).
17. Select the index for the version that matches the "ProductID" [3][ref_3].
    ```{ps1}
    Get-WindowsImage -ImagePath c:\working\wim\install.wim
    ```
18. Mount, update, and recreate the `install.wim` file [3][ref_3].
    ```{ps1}
    mkdir c:\working\mount
    Mount-WindowsImage -Path c:\working\mount\ -ImagePath c:\working\wim\install.wim -Index 1
    Add-WindowsDriver -Path c:\working\mount\ -Driver c:\working\drivers -Recurse
    Dismount-WindowsImage -Path c:\working\mount\ –Save
    ```
19. Copy the `install.wim` file from the hard drive (`c:/working/wim/install.wim`) to the USB FlashDrive (`~/sources/install.wmi`).

## Driver Links

* [NUC](https://www.asus.com/us/supportonly/nuc13anbi7/helpdesk_download/)

## Cached files

* [choco_install.ps1][file_1]
* [autounattend.xml][file_2]
* [Wi-Fi-Placeholder.xml][file_3]

## References

1. [How to find your windows 11 product key][ref_1]
2. [Generate autounattend.xml files for Windows 10/11][ref_2]
3. [How to Add/Remove Drivers to a Windows WIM/ISO Install Image][ref_3]


[file_1]: ./choco_install.ps1
[file_2]: ./autounattend.xml
[file_3]: ./Wi-Fi-Placeholder.xml
[ref_1]: https://web.archive.org/web/20240524002428/https://www.howtogeek.com/784986/how-to-find-your-windows-11-product-key/ "ShowKeyPlus"
[ref_2]: https://schneegans.de/windows/unattend-generator/
[ref_3]: https://woshub.com/integrate-drivers-to-windows-install-media/
