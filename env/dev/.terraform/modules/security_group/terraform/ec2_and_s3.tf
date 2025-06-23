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

resource "aws_ebs_volume" "extra_1gb" {
  availability_zone = aws_instance.web.availability_zone
  size              = 1  # 1 GB volume
  tags = {
    Name = "web1-extra-1gb"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.extra_1gb.id
  instance_id = aws_instance.web.id
  force_detach = true
}

resource "aws_s3_bucket" "audi_s3" {
  bucket = "audi-s3"

  tags = {
    Name        = "audi-s3"
    Environment = "Dev"
  }
}