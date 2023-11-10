resource "shoreline_notebook" "selinux_or_apparmor_policy_violations_incident" {
  name       = "selinux_or_apparmor_policy_violations_incident"
  data       = file("${path.module}/data/selinux_or_apparmor_policy_violations_incident.json")
  depends_on = [shoreline_action.invoke_disable_selinux]
}

resource "shoreline_file" "disable_selinux" {
  name             = "disable_selinux"
  input_file       = "${path.module}/data/disable_selinux.sh"
  md5              = filemd5("${path.module}/data/disable_selinux.sh")
  description      = "command description unknown"
  destination_path = "/tmp/disable_selinux.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_disable_selinux" {
  name        = "invoke_disable_selinux"
  description = "command description unknown"
  command     = "`chmod +x /tmp/disable_selinux.sh && /tmp/disable_selinux.sh`"
  params      = []
  file_deps   = ["disable_selinux"]
  enabled     = true
  depends_on  = [shoreline_file.disable_selinux]
}

