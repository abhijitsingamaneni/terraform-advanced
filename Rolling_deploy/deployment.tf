provider "aws" {
  region             = "us-west-2"
}

module "deployment" {
  source            = "./modules/autoscaling"
  ami_id            = "${var.ami_id}"
  key_pair          = "${var.key_pair}"
  instance_type     = "${var.instance_type}"
  grace_period      = "${var.grace_period}"
  elb_capacity      = "${var.elb_capacity}"
  desired_capacity  = "${var.desired_capacity}"
  min_instances     = "${var.min_instances}"
  max_instance      = "${var.max_instances}"
  instance_profile  = "${var.instance_profile}"
  health_check_type = "${var.health_check_type}"
  subnets           = "${var.subnets}"
  security_groups    = "${var.security_groups}"
  loadbalancer      = "${var.loadbalancer}"
}
