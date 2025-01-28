variable "aws_region" {}
variable "cidr_block" {}
  

provider "aws" {
region = var.aws_region

}

terraform {
    backend "s3" {
        bucket = "terraform-state-mobann-jenkins"
        key = "mobann/development/terraform.tfstate"
        region = "us-east-2"
        use_lockfile = true
}
}

resource "aws_vpc" "mobann-vpc" {
    cidr_block = var.cidr_block 
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "mobann-vpc"
    }
}

module "mobann_module" {
  source = "./modules"
  
}