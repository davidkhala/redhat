# for linux

set -e
download() {
    curl -o crc https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/install-binary/o/redhat%2Fopenshift%2Fcrc
    sudo mv crc /usr/local/bin
}
ubuntu-preset() {
    sudo apt install -y virtiofsd virt-manager
}

"$@"
