provider "aws" {
  region     = "us-east-1"
  access_key = "testUser"
  secret_key = "testAccessKey"
  skip_credentials_validation = true
  skip_requesting_account_id   = true
  endpoints {
    lambda      = "http://localhost:4566"
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "dist/example.js"
  output_path = "dist/zip/example.zip"
}

resource "aws_lambda_function" "example_lambda" {
  filename      = "dist/zip/example.zip"
  function_name = "Example"
  role          = "arn:aws:iam::123456789012:role/your-iam-role"
  handler       = "example.handler"
  runtime       = "nodejs18.x"
}
