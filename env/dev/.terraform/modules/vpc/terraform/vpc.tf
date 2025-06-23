resource "aws_vpc" "audi_vpc" {
  cidr_block = var.block

  tags = {
    Name = "audi-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.audi_vpc.id

  tags = {
    Name = "audi-igw"
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.audi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.audi_vpc.id
  cidr_block              = var.block1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.audi_vpc.id
  cidr_block              = var.block2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.audi_vpc.id
  cidr_block        = var.block3
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1"
  }
}
  resource "aws_subnet" "private_subnet2" {
    vpc_id            = aws_vpc.audi_vpc.id
    cidr_block        = var.block4
    availability_zone = "us-east-1b"

    tags = {
      Name = "private-subnet-2"
    }
  }
resource "aws_route_table_association" "public_subnet1_assoc" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.audi_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "default-public-route"
  }
}
