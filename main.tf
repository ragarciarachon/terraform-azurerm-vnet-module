# Bloque que permite definir valores temporales
locals {
    default_tags = {
        owner       = var.owner_tag
        environment = var.environment_tag
    }

    # Función que une los tags
    merged_tags = merge(local.default_tags, var.vnet_tags)
}

# Recursos para la vnet
# Las variables se toman del archivo terraform.tfvars
resource "azurerm_virtual_network" "example" {
    name                = var.vnet_name
    location            = var.vnet_location
    resource_group_name = var.existent_resource_group_name
    address_space       = var.vnet_address_space

    tags = local.merged_tags
}
