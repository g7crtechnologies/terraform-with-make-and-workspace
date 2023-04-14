locals {
  resource_group_name = module.rg.rg_name
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

resource "azurerm_shared_image_gallery" "my-gallery" {
  name                = var.shared_image_gallery
  location            = var.location
  resource_group_name = local.resource_group_name
  description         = var.description
}

# resource "azurerm_shared_image" "my-image" {
#   for_each            = var.shared_image
#   name                = each.value.name
#   gallery_name        = azurerm_shared_image_gallery.my-gallery.name
#   location            = var.location
#   resource_group_name = local.resource_group_name
#   os_type             = each.value.os_type

#   identifier {
#     publisher = each.value.publisher
#     offer     = each.value.offer
#     sku       = each.value.sku
#   }
# }
