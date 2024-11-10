variable "ec2_ami_id" {
  type = string
  #default = "ami-0261755bbcb8c4a84"
  default = "ami-0261755bbcb8c4a84"
  #ami-0c55b159cbfafe1f0 AMI para Ubuntu 20.04 en us-east-1
  #ami-005fc0f236362e99f
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

variable "ec2_access_key" {
  type = string
}

variable "ec2_secret_key" {
  type = string
}

variable "ec2_subnet_public_id" {
  type = string
}

variable "ec2_key_private" {
  type = string
}

variable "ec2_public_ip" {
  type = string
}

variable "ec2_token_github" {
  type = string
}