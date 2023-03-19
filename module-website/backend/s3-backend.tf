resource "aws_s3_bucket" "backend" {

  bucket = "g-backend-terraform"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_acl" "acl-backend" {
  bucket = aws_s3_bucket.backend.id
  acl    = "private"
}