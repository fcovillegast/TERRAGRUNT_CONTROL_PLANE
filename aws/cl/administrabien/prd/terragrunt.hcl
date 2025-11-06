terraform {
  source  = "git::https://github.com/fcovillegast/TERRAFORM_CONTROL_PLANE.git//?ref=main"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
}

remote_state {
  backend     = "s3"

  config = {
    key             = "TERRAGRUNT_CONTROL_PLANE/aws/cl/administrabien/prd/${path_relative_to_include()}/terraform.tfstate"
    bucket          = "administrabien-tfstate"
    region          = "sa-east-1"
    encrypt         = true
  }
}