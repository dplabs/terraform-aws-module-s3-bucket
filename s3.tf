resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.bucket_name

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(local.common_tags, { Type = local.is_website_redirection ? "website-redirection" : local.is_website ? "website" : "data-storage" })
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = local.is_website ? false : true
  block_public_policy     = local.is_website ? false : true
  ignore_public_acls      = local.is_website ? false : true
  restrict_public_buckets = local.is_website ? false : true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
