include "root" {
  path = find_in_parent_folders()
}

locals {
    middle_keys = read_terragrunt_config(find_in_parent_folders("prd.hcl"))
}

inputs = merge(
  local.middle_keys.locals,
  {
    vpc_id="vpc-05265640667ddf865"
    cidr_list = [
      {cidr="172.31.0.0/24",zone="sa-east-1a"},
      {cidr="172.31.1.0/24",zone="sa-east-1b"},
      {cidr="172.31.2.0/24",zone="sa-east-1c"}
    ]
    name_prefix="ab"

})