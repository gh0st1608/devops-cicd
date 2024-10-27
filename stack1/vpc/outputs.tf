output "vpc_id" {
   value = aws_vpc.vpc.id
}

output "seg_group_django_id" {
   value = aws_default_security_group.default_security_group.id
}

output "subnet_public_id" {
  value  = aws_subnet.subnet_public.id
}

output "subnet_private_id" {
  value  = aws_subnet.subnet_private.id
}
