#Get folder for size inspection CI/CB
$path = "C:\Temp"

 # Get folder size in bytes
$sizeBytes = (Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum

  # Convert to GB and round to nearest whole number
$sizeGB = [math]::Round($sizeBytes / 1GB)

  # Compare against 26 GB
if ($sizeGB -gt 26) {
    Write-Host "Non-Compliant"
}

# Set a String type CI/CB item with 'non exist'
