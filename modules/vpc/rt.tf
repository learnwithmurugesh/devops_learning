resource "aws_route_table" "public" {
  vpc_id = aws_vpc.audi.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.audi_igw.id
  }

  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
