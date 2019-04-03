# Simple Static Hosting

Walkthrough to understand how to get simple hosting up and running cheeply.

## Prerequisites

* [Azure][azure] Account
* Domain from [GoDaddy][godaddy]

## Steps

1. Get a custom domain from [GoDaddy][godaddy].
2. Setup a [Storage Account](#azure-storage) on [Azure][azure].
   * Select the name by mashing the keyboard.
   * Select "Cool", "LRS", and no secure transfer as the [configuration](#azure-storage-config).
   * [Configure](#azure-storage-domain) the custom domain.
   * Enable [static hosting](#azure-storage-site)
3. Upload the [files](#azure-storage-files)
4. Navigate to [GoDaddy][godaddy]'s [home screen](#godaddy-home)
5. Configure [CNAME](#godaddy-dns-cnames)s in the DNS.
   * A total three (3) _records_ are needed, but one will be created automatically.
6. Configure Domain [forwarding](#godaddy-dns-forward)s in the DNS.



## Known Limitations

1. You can not use a custom SSL cert on the vanity domain.

## Images

<a name="azure-storage" />
![Azure Storage](azure-storage.jpg?raw=true)

<a name="azure-storage-config" />
![Azure Storage Configuration](azure-storage-config.jpg?raw=true)

<a name="azure-storage-domain" />
![Setup Custom Domain](azure-storage-domain.jpg?raw=true)

<a name="azure-storage-site" />
![Static Hosting](azure-storage-site.jpg?raw=true)

<a name="azure-storage-files" />
![Upload Files](azure-storage-files.jpg?raw=true)

<a name="godaddy-home" />
![GoDaddy Home](godaddy-home.jpg?raw=true)

<a name="godaddy-dns-cnames" />
![CNAME config](godaddy-dns-cnames.jpg?raw=true)

<a name="godaddy-dns-forward" />
![Forwarding](godaddy-dns-forward.jpg?raw=true)

[azure]: https://portal.azure.com
[godaddy]: https://godaddy.com