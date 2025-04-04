# VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# SUBNET
resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]

  tags = {
    Name = "subnets"
  }
}

# INTERNET GATEWAY

# ROUTE TABLE

# ROUTE TABLE ASSOCIATION