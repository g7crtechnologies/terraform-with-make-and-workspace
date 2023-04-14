variable "policy_definition" {
  type = list(object({
    name         = string
    display_name = string
    policy_type  = string
    mode         = string
    policy_rule  = string

  }))
}

variable "policy_assignment" {
  type = list(object({
    name         = string
    parameters = string
  }))
}