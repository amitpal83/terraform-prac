module "prod-security" {
  source   = "../modules/security"
  vpc_id   = module.prod-network.vpc_id
  vpc_name = module.prod-network.vpc_name
  env      = module.prod-network.env
}

