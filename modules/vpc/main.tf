resource "huaweicloud_vpc" "this" {
  region = var.vpc_region
  name   = var.vpc_name
  cidr   = var.vpc_cidr
}

resource "huaweicloud_vpc_subnet" "this" {
  for_each          = var.vpc_subnets
  region            = var.vpc_region
  name              = each.value.name
  cidr              = each.value.cidr
  gateway_ip        = each.value.gateway_ip
  vpc_id            = huaweicloud_vpc.this.id
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}