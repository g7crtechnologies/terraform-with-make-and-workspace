variable "location" {
  type = string

  description = "The Azure region where resources will be deployed."
}

variable "description" {
  type        = string
  description = "description about shared gallery"
}

variable "shared_image_gallery" {
  type        = string
  description = "The name of the shared image gallery"
}

# variable "shared_image" {
#   type = map(object({
#     name      = string
#     os_type   = string
#     publisher = string
#     offer     = string
#     sku       = string
#   }))
#   description = "The name of the shared image definition"
# }

