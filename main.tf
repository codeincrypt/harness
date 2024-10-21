# Specify the provider
provider "aws" {
  region = var.aws_region
}

# Input variables
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # Default region
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The ACL for the S3 bucket"
  type        = string
  default     = "private" # Default ACL
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true # Default to true
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  # Optional: Enable versioning
  versioning {
    enabled = var.enable_versioning
  }

  # Optional: Set up lifecycle rules
  lifecycle {
    prevent_destroy = true # Prevent accidental deletion
  }

  # Tags for the bucket
  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

# Optional: Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
