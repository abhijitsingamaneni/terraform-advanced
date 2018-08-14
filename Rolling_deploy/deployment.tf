provider "aws" {
  region             = "us-west-2"
}

variable "ami_id" {}
variable "sg" {}
variable "key_name" {}
variable "instance_type" {}
variable "subnets_group" {}
variable "loadbalancer" {}
variable "graceperiod" {}
variable "elb_instance_capacity" {}
variable "capacity_desired" {}
variable "min_instances" {}
variable "max_instances" {}
variable "health_check_type" {}
variable "iam_profile" {}

module "generic_application" {
  source            = "./modules/generic_job"
  ami_ID            = "${var.ami_id}"
  key               = "${var.key_name}"
  type              = "${var.instance_type}"
  grace_period      = "${var.graceperiod}"
  elb_capacity      = "${var.elb_instance_capacity}"
  desired_capacity  = "${var.capacity_desired}"
  min_instance_size = "${var.min_instances}"
  max_instance_size = "${var.max_instances}"
  instance_profile  = "${var.iam_profile}"
  health_check      = "${var.health_check_type}"
  subnets           = "${var.subnets_group}"
  security_group    = "${var.sg}"
  lb                = "${var.loadbalancer}"
}
