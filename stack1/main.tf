module "ec2" {
  source   = "./ec2"
  ec2_key_name = module.keypair.keypair_key_name
  ec2_subnet_public_id = module.vpc.subnet_public_id
  ec2_security_group_id = module.vpc.seg_group_django_id
  ec2_access_key = var.access_key
  ec2_secret_key = var.secret_key
  ec2_key_private = var.key_private
  ec2_public_ip = module.elasticip.elip_public_ip
  ec2_token_github = var.token_github
}

module "keypair"{
  source = "./keypair"
  keypair_key_public = var.key_public
}

module "vpc" {
  source = "./vpc"
}

module "ecr"{
  source = "./ecr"
  ecr_repository_name = var.repository
}

module "elasticip"{
  source = "./elastic_ip"
  elip_instance_id = module.ec2.ec2_instance_id
}

module "s3" {
  source = "./s3"
  s3_bucket_name = var.bucket_name
}

/* module "route53"{
  source = "./route53"
  route53_public_ip = module.elasticip.elip_public_ip
  route53_domain = var.domain
} */
