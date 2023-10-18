variable "bucket_name" {
  description = "Bucket name"
  type        = string
  default     = null
}

variable "domain_name" {
  description = "URL to redirect to"
  type        = string
  default     = null
}

variable "redirect_to" {
  description = "URL to redirect to"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)
}
