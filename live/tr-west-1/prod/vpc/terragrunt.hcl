include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/vpc"
}

inputs = {
  vpc_region               = "${include.root.locals.region}"
  vpc_name                 = "${include.root.locals.tenant}-${include.root.locals.region}-${include.root.locals.env}-vpc"
  vpc_cidr                 = "10.0.0.0/16"
  vpc_description          = "https://registry.terraform.io/providers/huaweicloud/huaweicloud/1.82.4/docs/resources/vpc"
  vpc_secondary_cidrs      = []
  vpc_tags = {
    Name        = "${include.root.locals.tenant}-${include.root.locals.region}-${include.root.locals.env}-vpc"
    Tenant      = "${include.root.locals.tenant}"
    Region      = "${include.root.locals.region}"
    Environment = "${include.root.locals.env}"
    ManagedBy   = "terragrunt"
  }
  vpc_enterprise_project_id = null
}