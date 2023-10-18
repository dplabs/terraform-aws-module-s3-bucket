resource "aws_s3_bucket_website_configuration" "s3_bucket_website" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  count = local.is_website ? 1 : 0
}

resource "aws_s3_bucket_cors_configuration" "s3_bucket_website_cors" {
  bucket = aws_s3_bucket.s3_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  count = local.is_website ? 1 : 0
}

resource "aws_s3_bucket_acl" "s3_bucket_website_acl" {
  bucket     = aws_s3_bucket.s3_bucket.id
  acl        = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_website_ownership]

  count = local.is_website ? 1 : 0
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_website_ownership" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket]

  count = local.is_website ? 1 : 0
}

resource "aws_s3_bucket_policy" "prod_media_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${local.bucket_name}",
          "arn:aws:s3:::${local.bucket_name}/*"
        ]
      },
      {
        Sid       = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${local.bucket_name}",
          "arn:aws:s3:::${local.bucket_name}/*"
        ]
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.s3_bucket]

  count = local.is_website ? 1 : 0
}
