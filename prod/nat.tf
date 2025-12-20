module "prod-nat" {
  source          = "../modules/nat"
  env             = module.prod-network.env
  public_subnet_1 = module.prod-network.public_subnet_id1
  vpc_name        = module.prod-network.vpc_name
}