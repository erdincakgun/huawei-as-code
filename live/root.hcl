locals {
  tenant = read_terragrunt_config(find_in_parent_folders("tenant.hcl")).locals.tenant
  region = read_terragrunt_config(find_in_parent_folders("region.hcl")).locals.region
  env    = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.env
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "huaweicloud" {
  region = "${local.region}"
}
EOF
}

generate "versions" {
  path      = "versions_override.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.4"
    }
  }
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket = "${local.tenant}-terraform-state"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "${local.region}"
    endpoints = {
      s3  = "https://obs.${local.region}.myhuaweicloud.com"
      sts = "https://sts.${local.region}.myhuaweicloud.com"
    }
    encrypt                     = true
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}