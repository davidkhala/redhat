set -e
projects() {
    oc projects
}
whoami() {
	oc whoami --show-server
}

$@
