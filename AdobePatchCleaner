# Adobe Patch Cleaner - Windows\Insteller
<#
Removes old .MSP files - older than 30 days (editable)
Based on Subject Signer property of file

And future adobe issues should have not be created by this; a full uninstaller/re-install should address anything drastic
#>

$Threshold = (Get-Date).AddDays(-30)
$Files = Get-ChildItem "C:\Windows\Installer\*.msp"

foreach ($File in $Files) {
    $Signature = Get-AuthenticodeSignature $File.FullName
    if ($Signature.SignerCertificate.Subject -match "Adobe") {
        if ($File.LastWriteTime -lt $Threshold) {
            Remove-Item $File.FullName -Force -Verbose
        }
    }
}
