output "s3_id" {
  value = aws_s3_bucket.private_s3_bucket.id
}

output "s3_bucket" {
  value = aws_s3_bucket.private_s3_bucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.private_s3_bucket.arn
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.private_s3_bucket.bucket_regional_domain_name
}

output "s3_bucket_website_endpoint" {
  value = aws_s3_bucket.private_s3_bucket.website_endpoint
}

