provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

# Fetch all S3 buckets
data "aws_s3_buckets" "all_buckets" {}

# Output the bucket names
output "bucket_names" {
  value = data.aws_s3_buckets.all_buckets.ids
}
