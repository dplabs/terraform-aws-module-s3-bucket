resource "aws_s3_bucket" "private_s3_bucket" {
  bucket = var.bucket

  lifecycle {
    prevent_destroy = false
  }

  tags = contains(keys(local.common_tags), "Type") ? local.common_tags : merge(local.common_tags, { Type = "data-storage" })
}

resource "aws_s3_bucket_public_access_block" "private_s3_bucket" {
  bucket = aws_s3_bucket.private_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "private_s3_bucket_redirection" {
  bucket = aws_s3_bucket.private_s3_bucket.id

  redirect_all_requests_to {
    host_name = var.redirect_to
  }

  count = var.redirect_to == null ? 0 : 1
}

