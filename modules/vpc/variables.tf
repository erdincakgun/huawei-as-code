variable "vpc_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

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