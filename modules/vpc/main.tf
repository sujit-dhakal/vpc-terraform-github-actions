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
  cidr_block = element(var.subnet_cidr,count.index)
  availability_zone = element(var.azs,count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# ROUTE TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = element(aws_subnet.subnets[*].id, count.index)
  route_table_id = aws_route_table.rt.id
}