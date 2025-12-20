module "dev-security" {
  source   = "../modules/security"
  vpc_id   = module.dev-vpc.vpc_id
  vpc_name = module.dev-vpc.vpc_name
  env      = module.dev-vpc.env
}