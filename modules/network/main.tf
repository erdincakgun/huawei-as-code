resource "huaweicloud_vpc" "vpc" {
  name   = var.vpc_name
  region = var.vpc_region
  cidr   = var.vpc_cidr
  tags   = var.vpc_tags
}

resource "huaweicloud_vpc_subnet" "subnet" {
  for_each          = toset(var.vpc_subnets)
  region            = var.vpc_region
  name              = each.value.name
  cidr              = each.value.cidr
  gateway_ip        = each.value.gateway_ip
  vpc_id            = huaweicloud_vpc.vpc.id
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}
