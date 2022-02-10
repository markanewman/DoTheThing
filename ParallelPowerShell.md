# Multiprocessing in PowerShell

There are several different ways to do parallel processing in PowerShell.
These examples will demonstrate some of them.
You will need PowerShell 7.0 to run some of these examples.

-- basic function --

function foo([int]$i) {
	Write-Host "sleeping $i ..."
	Start-Sleep $i
}

--- single exec --

$then = Get-Date
foo -i 3
$now = Get-Date
($now - $then).TotalSeconds

--- multi exec ---

$then = Get-Date
$list = 1..10
$list | Foreach-Object -Process { foo -i $_ }
$now = Get-Date
($now - $then).TotalSeconds

--- thread parallel multi exec ---

$then = Get-Date
$list = 1..10
$foo = $function:foo.ToString()
$list | Foreach-Object -Parallel { $function:foo = $using:foo; foo -i $_ } -ThrottleLimit 5
$now = Get-Date
($now - $then).TotalSeconds

--- background job multi exec ---
* launches all jobs

$then = Get-Date
$scriptblock = {
	$function:foo = $using:foo
	$i = $using:_
	foo -i $i
}
$list = 1..10
$foo = $function:foo.ToString()
$jobs = $list | Foreach-Object -Process { Start-Job -ScriptBlock $scriptblock }
$jobs | Wait-Job | Receive-Job
$now = Get-Date
($now - $then).TotalSeconds

--- background thread job multi exec ---

$then = Get-Date
$scriptblock = {
	$function:foo = $using:foo
	$i = $using:_
	foo -i $i
}
$list = 1..10
$foo = $function:foo.ToString()
$jobs = $list | Foreach-Object -Process { Start-ThreadJob -ScriptBlock $scriptblock -ThrottleLimit 5 }
$jobs | Wait-Job | Receive-Job
$now = Get-Date
($now - $then).TotalSeconds

--- separate process multi exec ---
* 

$then = Get-Date
$scriptblock = {
	$tmp = {
		Write-Host "sleeping $_ ..."
		Start-Sleep $_
	}
	$tmp = $ExecutionContext.InvokeCommand.ExpandString($tmp)
	$tmp = $tmp.Replace("""","'")
	Start-Process -FilePath "powershell" -ArgumentList $tmp -Wait
}
$list = 1..10
$list | Foreach-Object -Parallel $scriptblock -ThrottleLimit 5
$now = Get-Date
($now - $then).TotalSeconds



