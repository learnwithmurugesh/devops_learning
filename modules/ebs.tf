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

