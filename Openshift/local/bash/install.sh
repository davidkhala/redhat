set -e
latest() {
    
    wget https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/latest/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    # OpenShift 4.22
    chmod +x crc-linux-2.64.0-amd64/crc
    sudo mv crc-linux-2.64.0-amd64/crc /usr/local/bin
    echo y | crc setup
    rm -rf crc-linux-2.64.0-amd64 crc-linux-amd64.tar.xz
}
uninstall() {
    crc cleanup
}
$@
