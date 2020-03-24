# Split folder

Sometimes I have a large amount of files in a single folder and I would like to parall process over them on different servers.
This splits a single folder into several versions of the folder with the files balanced between them.

## Steps

1. Load in the `$path` and `$splitCount`
```{ps1}
$path = 'd:/xxx/yyy'
$splitCount = 6
```
2. Check the file count as a sanity check
```{ps1}
$files = Get-ChildItem -Path $path -File
($files | Measure-Object).Count
```
3. Redistribute the files
```{ps1}
1..$splitCount | ForEach-Object { New-Item -ItemType Directory -Path "$path.$_" }
$i = 0
$files | ForEach-Object { Move-Item "$path/$_" "$path.$((++$i % $load) + 1)" }
```
