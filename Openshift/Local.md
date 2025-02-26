# Openshift Local

aka. Red Hat CodeReady Containers (CRC)

[CRC.org](https://github.com/crc-org)
> If you want to use CRC without any Red Hat software, there is also a bundle for [OKD](https://okd.io/), which configures a VM based on Fedora CoreOS.

## Install

<https://console.redhat.com/openshift/create/local>

Minimum Hardware

|Preset Name| Description |CPUs| RAM| Disk Space|
| ---- |---- |---- |---- |---- |---- |
|`openshift`| OpenShift Container Platform (default) | 4 |10.5 GB| 35 GB|
|`okd` | OKD |4 |10.5 GB| 35 GB|
|`microshift` |MicroShift| 2 |4 GB |35 GB|

1. Get the binary
    - [Windows:.msi](https://cn9yc2hk0gzg.objectstorage.ap-singapore-1.oci.customer-oci.com/n/cn9yc2hk0gzg/b/install-binary/o/redhat%2Fopenshift%2Fcrc-windows-amd64.msi)
2. Install and `crc setup`
3. **pull secret** is required in `crc start`

## Manage

use Podman Desktop

- By enable the [OpenShift Local extension](https://podman-desktop.io/docs/openshift/openshift-local)
- Use it to select the desired preset and create, start, stop, or destroy your CRC VM
