variable "bucket" {
  description = "Bucket name"
  type        = string
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)
}

