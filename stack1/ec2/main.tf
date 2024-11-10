resource "aws_instance" "django_app" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  subnet_id = var.ec2_subnet_public_id
  key_name = var.ec2_key_name
  vpc_security_group_ids = [var.ec2_security_group_id]

  tags = {
    Name = "server_django"
  }
}

resource "null_resource" "configure_ec2" {
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = fileexists("deploy.pem") ? file("deploy.pem") : var.ec2_key_private
    agent = false
    host     = var.ec2_public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "mkdir actions-runner && cd actions-runner",
      "curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz",
      "tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz",
    ]
  }
}