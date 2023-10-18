variable "bucket_name" {
  description = "Bucket name to use for S3 data storage"
  type        = string
  default     = null
}

variable "domain_name" {
  description = "Name of the domain / subdomain to host or being redirected from"
  type        = string
  default     = null
}

variable "redirect_to" {
  description = "Name of the domain / subdomain to redirect to"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)
}
