variable "vpc_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_description" {
  type = string
}

variable "vpc_enhanced_local_route" {
  type = string
}

variable "vpc_secondary_cidrs" {
  type = list(string)
}

variable "vpc_tags" {
  type = map(string)
}

variable "vpc_enterprise_project_id" {
  type = string
}
