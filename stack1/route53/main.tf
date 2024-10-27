resource "aws_route53_zone" "django_zona" {
  name = "${var.route53_domain}"  # Cambia a tu dominio
}

resource "aws_route53_record" "django_record" {
  zone_id = aws_route53_zone.django_zona.zone_id
  name     = "dev.${var.route53_domain}"  # Cambia a tu subdominio si es necesario
  type     = "A"
  ttl      = 300

  # Apunta al IP de la instancia
  records = [var.route53_public_ip]
}