# Fetch all S3 buckets
data "aws_s3_buckets" "all_buckets" {}

# Output the bucket names
output "bucket_names" {
  value = data.aws_s3_buckets.all_buckets.ids
}
