# for linux

set -e
install() {
    wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.49.0/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    chmod +x crc-linux-2.49.0-amd64/crc
    sudo mv crc-linux-2.49.0-amd64/crc /usr/local/bin
    echo y | crc setup
    rm -rf crc-linux-2.49.0-amd64 crc-linux-amd64.tar.xz
}

install-stable() {
    # Openshift 4.17

    wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.47.0/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    chmod +x crc-linux-2.47.0-amd64/crc
    sudo mv crc-linux-2.47.0-amd64/crc /usr/local/bin
    echo y | crc setup
    rm -rf crc-linux-2.47.0-amd64 crc-linux-amd64.tar.xz
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
uninstall() {
    crc cleanup
}

open() {
    xdg-open https://console-openshift-console.apps-crc.testing
}

"$@"
