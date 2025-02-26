function Fetch {
    $Uri = "https://cn9yc2hk0gzg.objectstorage.ap-singapore-1.oci.customer-oci.com/n/cn9yc2hk0gzg/b/install-binary/o/redhat%2Fopenshift%2Fcrc-windows-amd64.msi"
    $Path = "crc-windows-amd64.msi"
    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
function Setup {
    # crc should be run in a shell without administrator rights
    Write-Output yes | crc setup
}
function Setup-AsRoot {
    # Force crc to be run in a shell with administrator rights
    crc config set skip-check-administrator-user true
    Setup
}

function Run {
    # File path of image pull secret (download from https://console.redhat.com/openshift/create/local)
    param(
        $PullSecret
    )
    
    if ([string]::IsNullOrEmpty($PullSecret)) {
        # Interactive
        crc start
    }
    else {
        crc start -p $PullSecret
    }
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}