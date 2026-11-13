set -e
install() {
    
    wget https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/latest/crc-linux-amd64.tar.xz
    tar xf crc-linux-amd64.tar.xz
    # OpenShift 4.22
    chmod +x crc-linux-2.65.0-amd64/crc
    sudo mv crc-linux-2.65.0-amd64/crc /usr/local/bin
    rm -rf crc-linux-2.65.0-amd64 crc-linux-amd64.tar.xz
}
setup() {
	echo y | crc setup
}
uninstall() {
	crc delete -f
    crc cleanup
	sudo rm -f /usr/local/bin/crc     	# 二进制
	rm -rf ~/.crc                       # machine 数据 + bundle 缓存
	rm -rf ~/.config/containers/crc     # 配置
	rm -rf ~/.cache/crc                 # 下载缓存
}
$@
