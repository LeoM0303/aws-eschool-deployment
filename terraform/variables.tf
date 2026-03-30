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

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH into instances"
  default     = "0.0.0.0/0"
}