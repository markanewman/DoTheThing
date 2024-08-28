# Reimage Windows

1. Download the Windows 11 [media creation tool](https://www.microsoft.com/software-download/windows11)
2. Make sure to have the latest drivers on hand.
   Extract the drivers to the hard drive.
   The raw `.inf` files must be present fot this to work.
   * [NUC](https://www.asus.com/us/supportonly/nuc13anbi7/helpdesk_download/)
3. Make sure to have the product key on hand [1].
   * Add "ShowKeyPlus" from the Windows Store
   * Run "ShowKeyPlus"
   * Copy out the "ProductID"
5. 
6. Make the bootable USB using the media creation tool.
7. Copy the install.wim (`d:/sources/install.wmi`) from the USB to the hard drive (`c:/working/wim/install.wim`).


## References

1. ["How to find your windows 11 product key"][1]
2. xxx
3. eee

[1]: https://web.archive.org/web/20240524002428/https://www.howtogeek.com/784986/how-to-find-your-windows-11-product-key/ "ShowKeyPlus"
