resource "aws_internet_gateway" "audi_igw" {
  vpc_id = aws_vpc.audi.id

  tags = {
    Name = "${var.environment}-igw"
  }
}
