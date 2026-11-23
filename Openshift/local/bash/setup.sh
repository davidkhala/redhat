set -e
install() {

	wget https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/latest/crc-linux-amd64.tar.xz
	tar xf crc-linux-amd64.tar.xz
	# OpenShift 5
	chmod +x crc-linux-2.65.0-amd64/crc
	sudo mv crc-linux-2.65.0-amd64/crc /usr/local/bin
	rm -rf crc-linux-2.65.0-amd64 crc-linux-amd64.tar.xz
}

install-oc() {
	wget --no-check-certificate https://downloads-openshift-console.apps-crc.testing/amd64/linux/oc.tar
	tar xf oc.tar
	rm oc.tar
	sudo mv oc /usr/local/bin
	oc version
}
run() {
	local PullSecret=$1
	# After a host reboot a stale docker.sock may remain and cause "bind: address already in use".
	# Remove it only if nothing is listening on it; VM and cluster data are untouched.
	local sock=~/.crc/machines/crc/docker.sock
	if [ -S "$sock" ] && ! ss -xl | grep -qF "$sock"; then
		echo "Removing stale socket $sock"
		rm -f "$sock"
	fi
	if [ -z "$PullSecret" ]; then
		crc start
	else
		crc start -p $PullSecret
	fi
}
stop() {
	local status
	status=$(crc status -o json 2>/dev/null || true)
	if echo "$status" | grep -Eq '"crcStatus": *"(Running|Starting)"'; then
		crc stop
	else
		echo "CRC VM is not running, skip stop"
	fi
}
resize() {
	stop

	local HOST_CPUS=$(nproc)
	local TARGET_CPUS=$((HOST_CPUS * 75 / 100))
	crc config set cpus $TARGET_CPUS # default 4

	local HOST_MEM_MB=$(free -m | awk '/Mem:/ {print $2}')
	local TARGET_MEM=$((HOST_MEM_MB * 75 / 100))

	crc config set memory $TARGET_MEM # default 10752 (MiB)
	crc config set disk-size 100      # default 31 (GiB)
	crc config view
	crc start
}
reset-size() {
	crc config unset memory
	crc config get memory
	crc config unset cpus
	crc config get cpus
	crc config unset disk-size
	crc config get disk-size
}

setup() {
	echo y | crc setup
}
uninstall() {
	crc delete -f
	crc cleanup
	sudo rm -f /usr/local/bin/crc   # 二进制
	rm -rf ~/.crc                   # machine 数据 + bundle 缓存
	rm -rf ~/.config/containers/crc # 配置
	rm -rf ~/.cache/crc             # 下载缓存
}
$@
