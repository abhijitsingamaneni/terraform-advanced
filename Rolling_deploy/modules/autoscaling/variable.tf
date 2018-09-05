variable "ami_id" {
  description = "ami_id from which to create ec2 instance"
}

variable "instance_type" {
  description = "type of ec2 instance"
}

variable "key_pair" {
  description = "key that you want to use"
}

variable "grace_period" {
  description = "time to allow the instances to be identifed"
}

variable "desired_capacity" {
  description =  "desired capacity of instances with this autoscaling group"
}

variable "min_instances" {
  description =  "min no of instances"
}

variable "max_instances" {
  description =  "max no of instances"
}

variable "instance_profile" {
  description = "instance profile that we need to use on the instance"
}

variable "health_check_type" {
  description = "type of health check that should be used(ec2 or elb)"
}

variable "subnets" {
  description = "subnet in which ec2 instances should be present"
}

variable "security_groups" {
  description = "security group to which ec2 instance should be attached"
}

variable "loadbalancer" {
  description = "load balancer to ec2 instance of the auto scaling group should be attached"
}
