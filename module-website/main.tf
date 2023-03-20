module "cloudfront" {
  source = "./cloudfront"

  bucket_id = module.s3.bucket_id
}

module "route53" {
  source = "./route53"
}

module "s3" {
  source = "./s3"
}