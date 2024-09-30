module "ec2" {
  source   = "./ec2"
  ec2_key_name = module.keypair.keypair_key_name
  ec2_security_group_id = module.securitygroups.gs_security_group_id
}

module "keypair"{
    source = "./keypair"
    keypair_key_public = var.key_public
}

module "securitygroups"{
  source = "./security_group"
}

module "elasticip"{
  source = "./elastic_ip"
  elip_instance_id = module.ec2.ec2_instance_id
}
