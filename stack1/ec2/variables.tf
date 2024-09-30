variable "ec2_ami_id" {
  type = string
  default = "ami-0261755bbcb8c4a84"
}

variable "ec2_instance_type" {
  default = "t2.small"
}

variable "ec2_key_name" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}