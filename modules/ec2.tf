resource "aws_instance" "web" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  key_name      = "audi-key"
  vpc_security_group_ids = ["sg-00e1ec51734d2a9b4"]
  subnet_id     = "subnet-09096cfbb5da0da6b"
  tags = {
    Name = "web1"
  }
}



