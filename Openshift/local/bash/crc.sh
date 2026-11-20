set -e


oc-login() {
	eval $(crc oc-env)
	local adminPassword=$(kubeadmin-password)
	oc login -u kubeadmin -p $adminPassword https://api.crc.testing:6443
}

open() {
	xdg-open https://console-openshift-console.apps-crc.testing
}
kubeadmin-password() {
	cat ~/.crc/machines/crc/kubeadmin-password
}

"$@"
