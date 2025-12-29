resource "huaweicloud_vpc" "vpc" {
  region                = var.vpc_region
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
  description           = var.vpc_description
  enhanced_local_route  = var.vpc_enhanced_local_route
  secondary_cidrs       = var.vpc_secondary_cidrs
  tags                  = var.vpc_tags
  enterprise_project_id = var.vpc_enterprise_project_id
}
