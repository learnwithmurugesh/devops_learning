resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "audi-key"
  vpc_security_group_ids = ["sg-00e1ec51734d2a9b4"]
  subnet_id     = var.block.subnet_id
  tags = {
    Name = "web1"
  }
}



