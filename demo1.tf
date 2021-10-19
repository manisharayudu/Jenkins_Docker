#Create AWS VPC
resource "aws_vpc" "myproject" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "myproject"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "myproject" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "myproject"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.myproject.id

  tags = {
    Name = "levelup-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "myproject" {
  vpc_id = aws_vpc.myproject.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

  tags = {
    Name = "levelup-public-1"
  }
}

resource "aws_route_table_association" "levelup-public-1-a" {
  subnet_id      = aws_subnet.myproject.id
  route_table_id = aws_route_table.myproject.id
}
