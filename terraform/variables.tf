variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Access Key"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}
