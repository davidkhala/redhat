# for linux

set -e

run() {
    local PullSecret=$1
    if [ -z "$PullSecret" ]; then
        crc start
    else
        crc start -p $PullSecret
    fi
}

install-oc() {
    wget --no-check-certificate https://downloads-openshift-console.apps-crc.testing/amd64/linux/oc.tar
    tar xf oc.tar
    rm oc.tar
    sudo mv oc /usr/local/bin
    oc version
}

oc-login() {
    eval $(crc oc-env)
    local adminPassword=${1:-developer}
    oc login -u kubeadmin -p $adminPassword https://api.crc.testing:6443 --insecure-skip-tls-verify=true
}

open() {
    xdg-open https://console-openshift-console.apps-crc.testing
}

"$@"
