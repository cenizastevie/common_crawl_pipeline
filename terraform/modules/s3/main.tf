variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}


resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.bucket.bucket
}
