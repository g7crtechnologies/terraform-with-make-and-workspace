module "shared_image_gallery" {
  source               = "../modules/tfs_azurerm_shared_img_gal"
  location             = var.location
  shared_image_gallery = var.shared_image_gallery
  # shared_image         = var.shared_image
  description          = var.description
}
