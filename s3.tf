resource "aws_s3_bucket" "lesson7_bucket" {
  bucket = "lesson7-tf-bucket"
  acl    = "private"

  tags = {
    Name        = "lesson7 bucket"
    Environment = "Dev"
  }
}
