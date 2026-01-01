include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "github.com/artifactsystems/terraform-huawei-vpc?ref=v1.0.0"
}

locals {
  name = "${include.root.locals.tenant}-${include.root.locals.region}-${include.root.locals.env}-${basename(get_terragrunt_dir())}"
}

inputs = {
  name   = "${local.name}"
  region = "${include.root.locals.region}"
  cidr   = "10.0.0.0/16"

  azs             = ["tr-west-1a", "tr-west-1b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Name        = "${local.name}"
    Tenant      = "${include.root.locals.tenant}"
    Region      = "${include.root.locals.region}"
    Environment = "${include.root.locals.env}"
    ManagedBy   = "terragrunt"
  }
}