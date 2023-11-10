terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "selinux_or_apparmor_policy_violations_incident" {
  source    = "./modules/selinux_or_apparmor_policy_violations_incident"

  providers = {
    shoreline = shoreline
  }
}