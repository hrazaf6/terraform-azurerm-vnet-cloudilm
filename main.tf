data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.this.name
  address_space       = var.vnet_address_space
  location            = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.this.location
  bgp_community       = var.enable_bgp_community ? var.bgp_community : null
  dynamic "ddos_protection_plan" {
    for_each = var.enable_ddos_protection_plan ? [var.enable_ddos_protection_plan] : []
    content {
      id     = var.id_ddos_protection_plan
      enable = var.enable_ddos_protection_plan
    }
  }
  dns_servers = var.enable_dns_servers ? var.dns_servers : null
  tags        = var.tags
}

resource "azurerm_subnet" "this" {
  for_each             = var.subnet_information
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value
  dynamic "delegation" {
    for_each = var.enable_delegation ? [1] : []
    content {
      name = var.delegation_name
      service_delegation {
        name    = var.service_delegation_name
        actions = var.service_delegation_actions
      }
    }
  }
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  service_endpoints                              = var.enable_service_endpoints ? var.service_endpoints : null
  service_endpoint_policy_ids                    = var.enable_service_endpoints ? var.service_endpoint_policy_ids : null
}
