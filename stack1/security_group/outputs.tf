output "gs_security_group_name" {
  value = aws_security_group.gs_django.name
}

output "gs_security_group_id" {
  value = aws_security_group.gs_django.id
}