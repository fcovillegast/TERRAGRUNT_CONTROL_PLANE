terraform {
  source  = "git::https://github.com/fcovillegast/TERRAFORM_CONTROL_PLANE.git//?ref=main"
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