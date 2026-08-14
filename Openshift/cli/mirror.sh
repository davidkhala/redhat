
download(){
  # for x86_64 
  wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/oc-mirror.tar.gz
  
}
install(){
  tar -xvf oc-mirror.tar.gz
  chmod +x oc-mirror
  sudo mv oc-mirror /usr/local/bin/
  oc-mirror version  # 验证

}
$@
