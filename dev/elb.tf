module "dev_elb" {
  source         = "../modules/elb"
  tgname         = "Dev-tg"
  vpc_id         = module.dev-vpc.vpc_id
  env            = module.dev-vpc.env
  PrivateServers = null
  PublicServers  = module.dev_instance.ec2_instance_id
  nlbname        = "Dev-nlb"
  Public_subnets = module.dev-vpc.public_subnet_ids
  sg_id          = module.dev-security.sg_id
}