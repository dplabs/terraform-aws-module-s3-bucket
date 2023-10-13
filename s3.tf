resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.bucket_name

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(local.common_tags, { Type = local.is_website_redirection ? "website-redirection" : local.is_website ? "website" : "data-storage" })
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
