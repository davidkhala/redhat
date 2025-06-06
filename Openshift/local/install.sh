set -e
latest() {
    wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.49.0/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    chmod +x crc-linux-2.49.0-amd64/crc
    sudo mv crc-linux-2.49.0-amd64/crc /usr/local/bin
    echo y | crc setup
    rm -rf crc-linux-2.49.0-amd64 crc-linux-amd64.tar.xz
}
stable() {
    # Openshift 4.17

    wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.47.0/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    chmod +x crc-linux-2.47.0-amd64/crc
    sudo mv crc-linux-2.47.0-amd64/crc /usr/local/bin
    echo y | crc setup
    rm -rf crc-linux-2.47.0-amd64 crc-linux-amd64.tar.xz
}
uninstall() {
    crc cleanup
}
$@
