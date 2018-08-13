variable "policy" {
  type        = "list"
  description = "policy that need to be attached to the specific role"
}

variable "policy_count" {
  default = "2"
}

variable "trusted_policy" {
  description = "trusted policy for the role specific role"
}
