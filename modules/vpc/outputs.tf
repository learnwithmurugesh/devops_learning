output "vpc_id" {
  value = aws_vpc.audi.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
