locals {
  common_tags = var.tags

  is_website_redirection = var.redirect_to != null
  is_website             = !local.is_website_redirection && var.domain_name != null
  is_data                = !local.is_website_redirection && !local.is_website

  bucket_name = local.is_website_redirection || local.is_website ? var.domain_name : var.bucket_name
}
