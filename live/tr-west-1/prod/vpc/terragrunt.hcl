include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/network"
}

inputs = {
  vpc_name   = "${include.root.locals.prefix}-vpc"
  vpc_region = "${include.root.locals.region}"
  vpc_cidr   = "10.0.0.0/16"
  vpc_tags   = "${include.root.locals.tags}"
  vpc_subnets = [
    {
      name              = "${include.root.locals.prefix}-subnet-private-1"
      cidr              = "10.0.1.0/24"
      gateway_ip        = "10.0.1.1"
      availability_zone = "tr-west-1a"
      tags              = "${include.root.locals.tags}"
    },
    {
      name              = "${include.root.locals.prefix}-subnet-private-2"
      cidr              = "10.0.2.0/24"
      gateway_ip        = "10.0.2.1"
      availability_zone = "tr-west-1b"
      tags              = "${include.root.locals.tags}"
    },
    {
      name              = "${include.root.locals.prefix}-subnet-public-1"
      cidr              = "10.0.101.0/24"
      gateway_ip        = "10.0.101.1"
      availability_zone = "tr-west-1a"
      tags              = "${include.root.locals.tags}"
    },
    {
      name              = "${include.root.locals.prefix}-subnet-public-2"
      cidr              = "10.0.102.0/24"
      gateway_ip        = "10.0.102.1"
      availability_zone = "tr-west-1b"
      tags              = "${include.root.locals.tags}"
    },
  ]
}