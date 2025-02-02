output "vpc_id" {
    value = aws_vpc.mobann_vpc.id
}

# output "ec2_ip" {
#     value = module.mobann_module.ec2_public_ip
# }