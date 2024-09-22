resource "aws_key_pair" "key" {
  key_name   = var.keypair_key_name
  public_key = file("keydev")
}