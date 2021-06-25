resource "aws_s3_bucket" "bucket" {
  bucket = "pitagoras-desafio-bucket"
  acl    = "private"

  tags = {
    Name        = "pitagoras-desafio-bucket"
  }
}
