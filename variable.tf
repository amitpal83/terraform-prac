variable "vpccidr" {}
variable "vpcname" {}
variable "subnet1_cidr" {}
variable "subnet1_name" {}
variable "igwname" {}
variable "subnet2_cidr" {}
variable "subnet2_name" {}
variable "subnet3_cidr" {}
variable "subnet3_name" {}
variable "devroutingtable" {}
variable "devsecuritygroup" {}
variable "securitygroupname" {}
variable "ami_id" {
  default = "ami-0ecb62995f68bb549"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "public_subnet_cidr_list" {}

variable "private_subnet_cidr_list" {}

variable "websecuritygroupname" {}

variable "env" {}

variable "ebs_volume_size" {
  default = 10
}

variable "az" {}