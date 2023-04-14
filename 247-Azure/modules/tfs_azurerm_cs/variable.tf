variable "location" {
  type = string
  default = "eastus"
  description = "location to deploy cs"
}

variable "account_name" {
  type = string
  default = "tfs-cs-hub-eu-speech"
  description = "name of cognitive speech account"
}

variable "kind" {
  type = string
  default = "SpeechServices"
  description = "Specifies the type of Cognitive Service Account"
}

variable "sku_name" {
  type = string
  default = "S0"
  description = "Specifies the SKU Name for this Cognitive Service Account"
}

variable "tags" {
 type = map(string) 
 default = {
   "terraform" = "1"
 }
 description = "resource tags"
}

