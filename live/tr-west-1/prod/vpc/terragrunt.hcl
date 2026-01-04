include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/vpc"
}

inputs = {
  name   = "${include.root.locals.name}"
  region = "${include.root.locals.region}"
  cidr   = "10.0.0.0/16"

  tags = {
    Name        = "${include.root.locals.name}"
    Tenant      = "${include.root.locals.tenant}"
    Region      = "${include.root.locals.region}"
    Environment = "${include.root.locals.env}"
    ManagedBy   = "terragrunt"
  }
}