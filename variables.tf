variable "bucket" {
  description = "Bucket name"
  type        = string
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

