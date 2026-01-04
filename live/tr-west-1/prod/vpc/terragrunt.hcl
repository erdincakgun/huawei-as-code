include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/vpc"
}

inputs = {
  vpc_name   = "${include.root.locals.name}"
  vpc_region = "${include.root.locals.region}"
  vpc_cidr   = "10.0.0.0/16"

  vpc_tags = {
    Name        = "${include.root.locals.name}"
    Tenant      = "${include.root.locals.tenant}"
    Region      = "${include.root.locals.region}"
    Environment = "${include.root.locals.env}"
    ManagedBy   = "terragrunt"
  }
}