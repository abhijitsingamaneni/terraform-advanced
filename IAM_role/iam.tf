provider "aws" {
  region                = "us-west-2"
}

module "s3_read_only_access" {
  source                = "./modules/policy/s3/readonly"
}

module "s3_full_access" {
  source                = "./modules/policy/s3/fullaccess"
}

module "trusted_ec2_policy" {
  source                = "./modules/trusted_policy/ec2_policy"
}

module "trusted_lamada_policy" {
  source                = "./modules/trusted_policy/lamada_policy"
}

module "s3" {
  source                = "./modules/roles/s3"
  policy                = "${list("${module.s3_read_only_access.s3_read_only_access}", "${module.s3_full_access.s3_full}")}"
  trusted_policy        = "${module.trusted_lamada_policy.lamada_policy}"
}
