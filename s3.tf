provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

resource "null_resource" "list_buckets" {
  provisioner "local-exec" {
    command = "aws s3api list-buckets --query 'Buckets[*].Name' --output json"
  }
}

output "bucket_names" {
  value = null_resource.list_buckets.id
}
