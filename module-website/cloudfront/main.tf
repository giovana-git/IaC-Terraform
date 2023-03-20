locals {
  s3_origin_id = "origin-s3-bucket"
}

resource "aws_cloudfront_distribution" "website-distribution" {
    origin {
        domain_name = var.regional_domain_name
        origin_id = local.s3_origin_id
    }

    enabled = true
    default_root_object = "index.html"

    default_cache_behavior {
      allowed_methods = ["GET", "HEAD"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = local.s3_origin_id
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      cloudfront_default_certificate = true
    }
}