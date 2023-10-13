output "s3_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "s3_bucket_website_endpoint" {
  value = local.is_website ? aws_s3_bucket_website_configuration.s3_bucket_website[0].website_endpoint : local.is_website_redirection ? aws_s3_bucket_website_configuration.s3_bucket_redirection[0].website_endpoint : null
}

