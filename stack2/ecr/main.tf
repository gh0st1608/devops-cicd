resource "aws_ecr_repository" "my_repository" {
  name                 = "django-app"  # Nombre del repositorio
  image_tag_mutability = "MUTABLE"        # O "IMMUTABLE", dependiendo de tus necesidades
  lifecycle {
    prevent_destroy = true  # Para evitar la eliminación accidental del repositorio
  }
}

output "repository_url" {
  value = aws_ecr_repository.my_repository.repository_url
}