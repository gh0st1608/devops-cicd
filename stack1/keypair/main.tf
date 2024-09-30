resource "aws_key_pair" "key" {
  key_name   = var.keypair_key_name
  public_key = var.keypair_key_public
}