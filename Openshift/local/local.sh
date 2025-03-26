# for linux

set -e
install() {
    curl -o crc https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/install-binary/o/redhat%2Fopenshift%2Fcrc
    chmod +x crc
    sudo mv crc /usr/local/bin
    echo y | crc setup
}

run() {
    local PullSecret=$1
    if [ -z "$PullSecret" ]; then
        crc start
    else
        crc start -p $PullSecret
    fi
}

ubuntu-install() {
    sudo apt install -y curl virtiofsd virt-manager
    install
    sudo reboot
    :
    crc setup
}

open() {
    xdg-open https://console-openshift-console.apps-crc.testing
}

"$@"
