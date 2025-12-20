module "dev_instance" {
  source            = "../modules/instance"
  ami_id            = "ami-087d1c9a513324697"
  instance_type     = "t2.micro"
  public_subnet_id  = module.dev-vpc.public_subnet_ids
  security_group_id = module.dev-security.sg_id
  key_name          = "ap-south-1-key"
  vpc_name          = module.dev-vpc.vpc_name
  env               = module.dev-vpc.env
  private_subnet_id = module.dev-vpc.private_subnet_ids

}
