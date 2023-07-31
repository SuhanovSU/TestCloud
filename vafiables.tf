variable "ya_zone" {
  description = "YA Zone"
  default     = "ru-central1-a"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for YA that will be attached to each resource."
  default = {
    "TerminationDate" = "Permanent",
    "Environment"     = "Development",
    "Team"            = "DevOps",
    "DeployedBy"      = "Terraform",
    "OwnerEmail"      = "devops@example.com"
  }
}

variable "deployment_prefix" {
  description = "Prefix of the deployment"
  type        = string
  default     = "demo"
}
