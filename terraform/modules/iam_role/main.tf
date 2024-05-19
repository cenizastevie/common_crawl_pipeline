variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "bucket_arn" {
  description = "The ARN of the S3 bucket"
  type        = string
}

resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "athena.amazonaws.com"
        },
        Effect = "Allow",
      },
    ]
  })
}

resource "aws_iam_role_policy" "policy" {
  role = aws_iam_role.role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${var.bucket_arn}",
          "${var.bucket_arn}/*"
        ]
      }
    ]
  })
}

output "role_arn" {
  value = aws_iam_role.role.arn
}
