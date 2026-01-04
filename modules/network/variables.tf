variable "vpc_name" {}

variable "vpc_region" {}

variable "vpc_cidr" {}

variable "vpc_tags" {
  type = map(string)
}

variable "vpc_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    gateway_ip        = string
    availability_zone = string
    tags              = map(string)
  }))
}
