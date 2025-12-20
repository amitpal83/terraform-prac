module "prod-network" {
  source            = "../modules/network"
  aws_region        = "us-east-2"
  vpccidr           = "172.20.0.0/16"
  vpcname           = "prod-vpc-module"
  public_cidr_list  = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  private_cidr_list = ["172.20.5.0/24", "172.20.6.0/24", "172.20.7.0/24"]
  az                = ["us-east-2a", "us-east-2b", "us-east-2c"]
  env               = "prod"

}  