resource "aws_s3_bucket" "audi_s3" {
  bucket = "audi-s3"

  tags = {
    Name        = "audi-s3"
    Environment = "Dev"
  }
}