function Fetch {
    $Uri = "https://cn9yc2hk0gzg.objectstorage.ap-singapore-1.oci.customer-oci.com/n/cn9yc2hk0gzg/b/install-binary/o/redhat%2Fopenshift%2Fcrc-windows-amd64.msi"
    $Path = "crc-windows-amd64.msi"
    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
function Setup {
    # crc should be run in a shell without administrator rights
    Write-Output yes | crc setup
    # Restart is required for Hyper-V install
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
function Set-Preset {
    param(
        [ValidateSet("openshift", "okd", "microshift")]
        $value
    )
    crc config set preset $value
}
function Open {
    Start-Process "https://console-openshift-console.apps-crc.testing"
    # Log in as user:
    #   Username: developer
    #   Password: developer
}
function Uninstall{
    crc cleanup
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
