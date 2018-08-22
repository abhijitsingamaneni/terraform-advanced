#This resource is used to create new luanch configuration with all the provided values. 
#This luanch configuration has lifecycle policy "create_before_destroy = true" 
#so, that it will first create the new luanch configuration befor it destroies the older one.

resource "aws_launch_configuration" "ec2-launch-configuration" {
    name_prefix                 = "${terraform.workspace}-"
    image_id                    = "${var.ami_ID}"
    instance_type               = "${var.type}"
    security_groups             = ["${split(",", var.security_group)}"]
    key_name                    = "${var.key}"
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
    max_size                    = "${var.max_instance_size}"
    min_size                    = "${var.min_instance_size}"
    desired_capacity            = "${var.desired_capacity}"
    min_elb_capacity            = "${var.elb_capacity}"
    health_check_grace_period   = "${var.grace_period}"
    health_check_type           = "${var.health_check}"
    load_balancers              = ["${split(",", var.lb)}"]
    vpc_zone_identifier         = ["${split(",", var.subnets)}"]
    launch_configuration        =
    "${aws_launch_configuration.ec2-launch-configuration.id}"

    tags = ["${concat(var.default_tags)}"]

    lifecycle {
      create_before_destroy = true
    }
}
