resource "aws_eip_association" "eip_association" {
  instance_id   = var.elip_instance_id
  allocation_id = aws_eip.eip.id
}

resource "aws_eip" "eip" {
  tags = {
    Name = "django_ip"
  }
}