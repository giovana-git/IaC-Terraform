module "cloudfront" {
  source = "./cloudfront"
}

module "route53" {
  source = "./route53"
}

module "s3" {
  source = "./s3"
}

module "backend" {
  source = "./backend"
}