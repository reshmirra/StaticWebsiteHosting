variable "region" {
    type = string
    default = "us-west-2"
}

variable "domain_name" {
  type = string
  default = "example.com"
  description = "Domain name"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type = map(string)
  default = {
    Project = "Static Website"
    Owner = "terraform"
  }
}