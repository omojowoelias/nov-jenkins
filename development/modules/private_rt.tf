resource "aws-eip" "eip_ngw" {
  domain = "vpc"
  
  tags = {
    Name = "mobann-ngw-eip"
  }
  
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws-eip.eip_ngw.id
  subnet_id = element(aws_subnet.public_subnet[*].id, 0)
  
  tags = {
    Name = "mobann-ngw"
  }
  
}