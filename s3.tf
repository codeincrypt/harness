# Specify the provider
provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "kartik-swarnkar-bucket-harness" # Change this to a unique bucket name
  acl    = "private"                # Set the desired ACL (e.g., private, public-read)

  # Optional: Enable versioning
  versioning {
    enabled = true
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
