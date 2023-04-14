variable "LbRules" {
  description = "List containing your load balancers parameters."
  type        = any
}
variable "prefix" {
  type        = string
  description = "Prefix applied on the load balancer resources names."
}

variable "location" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "nic_id" {
  type        = string
  description = "nic id "
}