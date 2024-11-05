resource "aws_key_pair" "key" {
  key_name   = var.keypair_key_name
  #public_key = coalesce(var.keypair_key_public, file("deploy"))
  public_key = fileexists("deploy") ? file("deploy") : var.keypair_key_public
}

/* resource "local_file" "private_key" {
  content  = aws_key_pair.key.private_key
  filename = "${path.module}/my-key.pem"
} */