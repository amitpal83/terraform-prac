module "privateec2" {
  source            = "../modules/instance"
  ami_id            = "ami-0c5ddb3560e768732"
  instance_type     = "t2.micro"
  private_subnet_id = module.prod-network.private_subnet_ids
  security_group_id = module.prod-security.sg_id
  key_name          = "us-east2-key"
  vpc_name          = module.prod-network.vpc_name
  env               = module.prod-network.env
  public_subnet_id  = module.prod-network.public_subnet_ids
}