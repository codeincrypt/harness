provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

data "aws_s3_bucket" "all_bucket" {}

output "bucket_names" {
  value = data.aws_s3_bucket.all_bucket.id
}
