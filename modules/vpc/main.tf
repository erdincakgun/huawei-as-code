resource "huaweicloud_vpc" "vpc_with_tags" {
  name   = var.vpc_name
  region = var.vpc_region
  cidr   = var.vpc_cidr
  tags   = var.vpc_tags
}
