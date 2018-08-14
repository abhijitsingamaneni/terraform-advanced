variable "ami_ID" {
  description = "ami_id from which to create ec2 instance"
}

variable "type" {
  description = "type of ec2 instance"
}

variable "key" {
  description = "key that you want to use"
}

variable "grace_period" {
  description = "time to allow the instances to be identifed"
}

variable "elb_capacity" {
  description = "capacity of instances"
}

variable "desired_capacity" {
  description =  "desired capacity of instances"
}

variable "min_instance_size" {
  description =  "min no of instances"
}

variable "max_instance_size" {
  description =  "max no of instances"
}

variable "instance_profile" {
  description = "instance profile that we need to use on the instance"
}

variable "health_check" {
  description = "type of health check that should be used"
}

variable "subnets" {
  description = "subnet in which ec2 instance are present"
}

variable "security_group" {
  description = "security group in which ec2 instance is present"
}

variable "lb" {
  description = "load balancer to attach"
}

variable "default_tags" {
  type = "list"
}
