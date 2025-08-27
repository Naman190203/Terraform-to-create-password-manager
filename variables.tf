

variable "key_vault_rg" {
  description = "The resource group name of the key vault"
  type        = string
  default     = "Test1RG"
}

variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
  default     = "TestKV1RG1"
}

variable "secrets" {
  type = list(string)
  default = ["secret1","secret2","secret3","secret4","secret5","secret6","secret7"]
}