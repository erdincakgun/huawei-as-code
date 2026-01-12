resource "huaweicloud_vpc" "this" {
  region = var.vpc_region
  name   = var.vpc_name
  cidr   = var.vpc_cidr
}