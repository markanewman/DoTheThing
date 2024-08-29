# Reinstall Windows

I want a nice fresh copy of Windows every now and then.
Think of it like spring cleaning.

1. Get a 8GB or more USB FlashDrive and give it a quick format.
2. Install [Rufus](https://rufus.ie) and "ShowKeyPlus" [1][ref_1] from the Windows store.
3. Download the [Windows 11 ISO](https://www.microsoft.com/software-download/windows11) directly from Microsoft.
4. Download the latest drivers and extract the drivers to the hard drive (`c:/working/drivers`).
   The raw `.inf` files must be present for this to work.
   ```{ps1}
   mkdir c:/working/drivers
   ```
6. Run ShowKeyPlus and record the "Installed Key".
7. Run Rufus to create a bootable Windows 11 recovery drive.
   * V4.5.2180: all default options
   * Click Start, deselect all options, click OK
8. Create and download an `autounattend.xml` file [2][ref_2] or use the [cached file][file_1].
   * **DO NOT** copy in the Installed Key.
     It gets added in later.
   * If the cached version is used, the user/pass is mark/password123.
     It **MUST** be changed before anything is done after first boot.
9. Wait for Rufus to complete.
10. Copy `autounattend.xml` to the root of the USB FlashDrive.
11. Add in the "Installed Key" from step 5 to the `autounattend.xml` file on the USB FlashDrive.
    Search for `<Key>` quick replace.
    It should be close to the top of the file. 
12. Copy the `install.wim` file from the USB FlashDrive (`~/sources/install.wim`) to the hard drive (`c:/working/wim/install.wim`).
    ```{ps1}
    mkdir c:\working\wim
    copy d:/sources/install.wim c:/working/wim/install.wim
    ```
13. In an Admin Powershell, find the index of the version of windows that corresponds to the Installed Key's SKU.
    ```{ps1}
    Get-WindowsImage -ImagePath C:\working\wim\install.wim
    ```
14. In an Admin Powershell, mount, update, and recreate the `install.wim` file [3][ref_3].
    ```{ps1}
    mkdir c:\working\mount
    Mount-WindowsImage -Path c:\working\mount\ -ImagePath c:\working\wim\install.wim -Index 6
    Add-WindowsDriver -Path c:\working\mount\ -Driver c:\working\drivers -Recurse
    Dismount-WindowsImage -Path c:\working\mount\ –Save
    rmdir c:\working\mount
    ```
15. Copy the `boot.wim` file from the hard drive (`c:/working/wim/boot.wim`) to the USB FlashDrive (`~/sources/boot.wim`).
    ```
    del d:/sources/install.wim
    copy c:/working/wim/install.wim d:/sources/install.wim
    ```
16. Restart the computer in recovery mode to allow USB boot.
    Start > Settings > System > Recovery > Advanced Startup > Restart Now

## Driver Links

* [NUC](https://www.asus.com/us/supportonly/nuc13anbi7/helpdesk_download/)

## Cached files

* [autounattend.xml][file_1]

## References

1. [How to find your windows 11 product key][ref_1]
2. [Generate autounattend.xml files for Windows 10/11][ref_2]
3. [How to Add/Remove Drivers to a Windows WIM/ISO Install Image][ref_3]


[file_1]: ./autounattend.xml
[ref_1]: https://web.archive.org/web/20240524002428/https://www.howtogeek.com/784986/how-to-find-your-windows-11-product-key/ "ShowKeyPlus"
[ref_2]: https://schneegans.de/windows/unattend-generator/
[ref_3]: https://woshub.com/integrate-drivers-to-windows-install-media/

# Post Install Checklist

* [ ] Change password
* [ ] Start > Settings > Accounts > Microsoft account > Sign in + restart
* [ ] Start > Settings > Windows Update > Check for updates + restart
* [ ] Install Chocolatey
