variable "domain_name" {
  type    = string
  default = "mydomain.com"
}

variable "dns_a_record_name" {
  type = string
}

variable "dns_a_record_ttl" {
  type = string

}

variable "dns_a_record_records" {
  type = list(string)
}

variable "dns_c_record_name" {
  type = string
}

variable "dns_c_record_ttl" {
  type = string

}

variable "dns_c_record_records" {
  type = list(string)
}

variable "product" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "count_of_vm" {
  type = any
}

variable "pvt_dns_rg" {
  type = string
}
