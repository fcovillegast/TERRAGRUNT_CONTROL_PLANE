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
      "10.0.0.0/24",
      "10.0.1.0/24",
      "10.0.2.0/24"
    ]
    availability_zone ="sa-east-1
    name_prefix="ab"

})