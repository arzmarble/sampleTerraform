resource "aws_vpc" "test-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "test-vpc"
  }
}

# Public 1
resource "aws_subnet" "vpc-pub-1" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "vpc-pub-1"
  }
}

# Public 2
resource "aws_subnet" "vpc-pub-2" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "vpc-pub-2"
  }
}

# Private 1
resource "aws_subnet" "vpc-pri-1" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "vpc-pri-1"
  }
}

# Private 2
resource "aws_subnet" "vpc-pri-2" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "vpc-pri-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "test-IGW" {
  vpc_id = aws_vpc.test-vpc.id
  tags = {
    Name = "test-IGW"
  }
}

# Route Public & IGW
resource "aws_route_table" "test-pub-RT" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-IGW.id
  }

  tags = {
    Name = "test-pub-RT"
  }
}

# Route & Public
resource "aws_route_table_association" "vpc-pub-1-a" {
  subnet_id      = aws_subnet.vpc-pub-1.id
  route_table_id = aws_route_table.test-pub-RT.id
}

resource "aws_route_table_association" "vpc-pub-2-a" {
  subnet_id      = aws_subnet.vpc-pub-2.id
  route_table_id = aws_route_table.test-pub-RT.id
}

