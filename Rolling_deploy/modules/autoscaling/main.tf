#This resource is used to create new luanch configuration with all the provided values. 
#This luanch configuration has lifecycle policy "create_before_destroy = true" 
#so, that it will first create the new luanch configuration befor it destroies the older one.

resource "aws_launch_configuration" "ec2-launch-configuration" {
    name_prefix                 = "${terraform.workspace}-"
    image_id                    = "${var.ami_id}"
    instance_type               = "${var.instance_type}"
    security_groups             = ["${split(",", var.security_group)}"]
    key_name                    = "${var.key_pair}"
    iam_instance_profile        = "${var.instance_profile}"

    root_block_device {
      volume_type = "gp2"
      volume_size = 22
      delete_on_termination = true
    }

    lifecycle {
      create_before_destroy = true
    }
}

#This resource is used to create new autoscaling group with all the provided values.
#This autoscaling group has lifecycle policy "create_before_destroy = true" 
#so, that it will first create the new autoscaling group befor it destroies the older one. 
#And also it uses newly created luanch configuration

resource "aws_autoscaling_group" "ec2-autoscaling-group" {
    name_prefix                 = "${terraform.workspace}-${var.ami_ID}"
    max_size                    = "${var.max_instances}"
    min_size                    = "${var.min_instances}"
    desired_capacity            = "${var.desired_capacity}"
    min_elb_capacity            = "${var.elb_capacity}"
    health_check_grace_period   = "${var.grace_period}"
    health_check_type           = "${var.health_check}"
    load_balancers              = ["${split(",", var.loadbalancer)}"]
    vpc_zone_identifier         = ["${split(",", var.subnets)}"]
    launch_configuration        =
    "${aws_launch_configuration.ec2-launch-configuration.id}"
    lifecycle {
      create_before_destroy = true
    }
}
