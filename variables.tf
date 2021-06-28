variable "resource_group_name" {}

variable "vnet_name" {
  default = "default_vnet"
}

variable "vnet_address_space" {
  default = ["172.17.0.0/16"]
}

variable "vnet_location" {
  default = null
}

variable "enable_bgp_community" {
  default = false
}

variable "bgp_community" {
  default = ""
}

variable "enable_ddos_protection_plan" {
  default = false
}

variable "id_ddos_protection_plan" {
  default = ""
}

variable "enable_dns_servers" {
  default = false
}

variable "dns_servers" {
  default = []
}

variable "enable_subnet_block" {
  default = false
}

variable "subnet_information" {
  type = any
  default = {
    "subnet_data"  = ["172.17.1.0/24"]
    "subnet_cache" = ["172.17.2.0/24"]
    "subnet_db"    = ["172.17.3.0/24"]
  }
}

variable "enable_delegation" {
  default = false
}

variable "delegation_name" {
  default = "delagation_default_name"
}

variable "service_delegation_name" {
  default = "Microsoft.Web/serverFarms"
}

variable "service_delegation_actions" {
  default = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/action"]
}

variable "enforce_private_link_endpoint_network_policies" {
  default = false
}

variable "enforce_private_link_service_network_policies" {
  default = false
}

variable "service_endpoints" {
  default = ["Microsoft.AzureActiveDirectory"]
}

variable "service_endpoint_policy_ids" {
  default = []
}

variable "enable_service_endpoints" {
  default = false
}

variable "attach_security_group" {
  default = false
}

variable "nsg" {
  default = ""
}

variable "tags" {
  default = {
    Name = "Dev_VNet"
  }
}