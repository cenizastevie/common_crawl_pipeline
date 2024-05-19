provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "athena-ccindex-results-bucket"
}

module "iam_role" {
  source     = "./modules/iam_role"
  role_name  = "athena-role"
  bucket_arn = module.s3_bucket.bucket_arn
}

resource "aws_athena_workgroup" "example" {
  name = "athena-workgroup"

  configuration {
    result_configuration {
      output_location = "s3://${module.s3_bucket.bucket_name}/output/"
    }
  }
}

module "glue" {
  source = "./modules/glue"
}

module "athena" {
  source        = "./modules/athena"
  database_name = module.glue.database_name
}
