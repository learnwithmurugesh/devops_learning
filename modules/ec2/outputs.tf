output "instance_id" {
  value = aws_instance.audi.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}
