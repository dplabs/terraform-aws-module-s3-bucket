output "s3_bucket" {
  value       = aws_s3_bucket.s3_bucket.bucket
  description = "Bucket name"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3_bucket.arn
  description = "Bucket ARN"
}

output "s3_bucket_hosted_zone_id" {
  value       = aws_s3_bucket.s3_bucket.hosted_zone_id
  description = "Bucket zone ID where bucket is hosted"
}

output "s3_bucket_regional_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
  description = "Bucket regional domain name"
}

output "s3_bucket_website_endpoint" {
  value       = local.is_website ? aws_s3_bucket_website_configuration.s3_bucket_website[0].website_endpoint : local.is_website_redirection ? aws_s3_bucket_website_configuration.s3_bucket_redirection[0].website_endpoint : null
  description = "Bucket website endpoint, in case of hosting a website or redirection"
}
