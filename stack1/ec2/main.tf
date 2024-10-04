
resource "aws_instance" "django_app" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = var.ec2_key_name
  vpc_security_group_ids = [var.ec2_security_group_id]

    provisioner "remote-exec" {
      inline = [
        "sudo apt-get update -y",
        "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
        "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
        "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
        "sudo apt-get update -y",
        "sudo apt-get install -y docker-ce",
        "sudo systemctl start docker",
        "sudo systemctl enable docker",
        "echo [default] > ~/.aws/config",
        "echo aws_access_key_id=${var.ec2_access_key} >> ~/.aws/config",
        "echo aws_secret_access_key=${var.ec2_secret_key} >> ~/.aws/config",
        "$(aws ecr get-login --no-include-email --region us-east-1)", # Iniciar sesión en ECR (debes tener configuradas las credenciales de AWS en la instancia)
        "docker run -d 533267070432.dkr.ecr.us-east-1.amazonaws.com/django_repository:latest" # Ejecutar el contenedor  
      ]

      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("django")  # Cambia la ruta a tu clave privada
        host        = self.public_ip
      }
    }

  tags = {
    Name = "server_django"
  }
}