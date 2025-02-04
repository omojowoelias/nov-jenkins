variable "vpc_id" {}
variable "vpc_cidr_block" {}
//variable "availability_zones" {}  
variable "availability_zones" {
  description = "List of availability zones to deploy subnets in"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"] # Replace with your region's zones
}

variable "public_subnet_count" {}
variable "private_subnet_count" {}
