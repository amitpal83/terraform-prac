module "dev-vpc" {
  source = "../modules/network"

  aws_region        = "ap-south-1"
  vpccidr           = "172.13.0.0/16"
  vpcname           = "dev-vpc-module"
  public_cidr_list  = ["172.13.25.0/24", "172.13.26.0/24", "172.13.27.0/24"]
  private_cidr_list = ["172.13.35.0/24", "172.13.36.0/24", "172.13.37.0/24"]
  az                = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  env               = "dev"
}