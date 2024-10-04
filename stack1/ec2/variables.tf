variable "ec2_ami_id" {
  type = string
  #default = "ami-0261755bbcb8c4a84"
  default = "ami-005fc0f236362e99f"
  #ami-0c55b159cbfafe1f0 AMI para Ubuntu 20.04 en us-east-1
  #ami-005fc0f236362e99f
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_key_name" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}

variable "ec2_access_key" {
  type = string
}

variable "ec2_secret_key" {
  type = string
}