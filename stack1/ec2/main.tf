
resource "aws_instance" "django_app" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = var.ec2_key_name
  vpc_security_group_ids = [var.ec2_security_group_id]
  tags = {
    Name = "server_django"
  }
}