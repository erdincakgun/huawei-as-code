resource "huaweicloud_vpc" "vpc_with_tags" {
  name   = var.vpc_name
  region = var.region
  cidr   = var.vpc_cidr
  tags   = var.tags
}
