module "prod_elb" {
  source         = "../Modules/elb"
  tgname         = "Prod-TG"
  vpc_id         = module.prod-network.vpc_id
  env            = module.prod-network.env
  PrivateServers = module.privateec2.ec2_instance_id
  PublicServers  = null
  nlbname        = "Prod-nlb"
  Public_subnets = module.prod-network.public_subnet_ids
  sg_id          = module.prod-security.sg_id
}