provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

data "aws_s3_buckets" "all_buckets" {}

output "bucket_names" {
  value = data.aws_s3_buckets.all_buckets.ids
}
