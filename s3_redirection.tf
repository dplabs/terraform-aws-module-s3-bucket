resource "aws_s3_bucket_website_configuration" "s3_bucket_redirection" {
  bucket = aws_s3_bucket.s3_bucket.id

  redirect_all_requests_to {
    host_name = var.redirect_to
  }

  count = local.is_website_redirection ? 1 : 0
}
