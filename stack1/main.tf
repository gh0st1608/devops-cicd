module "ec2" {
  source   = "./ec2"
  ec2_key_name = module.keypair.keypair_key_name
}

module "keypair"{
    source = "./keypair"
}