provider "aws" {
  region                = "us-west-2"
}

# This module is used to creat a s3 policy with read only access
module "s3_read_only_access" {
  source                = "./modules/policy/s3/readonly"
}

# This module is used to creat a s3 policy with full access# 
module "s3_full_access" {
  source                = "./modules/policy/s3/fullaccess"
}

# This module is used to creat a ec2 assume role data 
module "trusted_ec2_policy" {
  source                = "./modules/trusted_policy/ec2_policy"
}

# This module is used to creat a lambda assume role data 
module "trusted_lamada_policy" {
  source                = "./modules/trusted_policy/lamada_policy"
}

# This module is used to creat a role with the help all the above modules 
module "s3" {
  source                = "./modules/roles/s3"
  policy                = "${list("${module.s3_read_only_access.s3_read_only_access}", "${module.s3_full_access.s3_full}")}"
  trusted_policy        = "${module.trusted_lamada_policy.lamada_policy}"
}
