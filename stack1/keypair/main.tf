resource "aws_key_pair" "key" {
  key_name   = var.keypair_key_name
  public_key = var.keypair_key_public
  #public_key = file("deploy")
}

/* resource "local_file" "private_key" {
  content  = aws_key_pair.key.private_key
  filename = "${path.module}/my-key.pem"
} */