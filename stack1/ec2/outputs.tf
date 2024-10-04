output "ec2_instance_id" {
  value = aws_instance.django_app.id
}

output "ec2_public_ip" {
  value = aws_instance.django_app.public_ip
}