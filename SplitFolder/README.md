# Split folder

Sometimes I have a large amount of files in a single folder and I would like to parall process over them on different servers.
This splits a single folder into several versions of the folder with the files balanced between them.

## Steps

1. Check the file count as a sanity check

```{ps1}
(Get-ChildItem -Recurse -File | Measure-Object).Count
```
2. Redistribute the files
```{ps1}
$path = 'd:/xxx/yyy'
$load = 6

1..$load | ForEach-Object { New-Item -ItemType Directory -Path "$path.$_" }
$files = Get-ChildItem -Path $path -File
$i = 0
$files | ForEach-Object { Move-Item "$path/$_" "$path.$((++$i % $load) + 1)" }
```
