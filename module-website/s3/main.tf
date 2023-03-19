resource "aws_s3_bucket" "website-bucket" {

  bucket = "website-bucket-gc"
}

resource "aws_s3_bucket_policy" "s3-policy" {

  bucket = aws_s3_bucket.website-bucket.id
  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "PublicReadGetObject",
			"Effect": "Allow",
			"Principal": "*",
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::website-bucket-gc/*"
		}
	]
}
POLICY
}

resource "aws_s3_bucket_website_configuration" "website-conf" {

  bucket = aws_s3_bucket.website-bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "acl-bucket" {
  bucket = aws_s3_bucket.website-bucket.id
  acl    = var.acl[1]
}

resource "aws_s3_object" "object-website" {
  bucket       = aws_s3_bucket.website-bucket.id
  key          = "index.html"
  source       = "./website/index.html"
  acl          = "public-read"
  content_type = "text/html"

}