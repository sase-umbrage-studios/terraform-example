provider "aws" {
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  access_key                  = "localstack"
  secret_key                  = "localstack"
  region                      = "us-east-1"
  endpoints {
    lambda = "http://localhost:4566"
  }
}

data "archive_file" "lambda_zip" {
  source_file = "src/functions/hello-world.js"
  output_path = "src/functions/hello-world.zip"
  type        = "zip"
}

resource "aws_lambda_function" "example_lambda" {
  function_name = "hello-world"
  filename      = "src/functions/hello-world.zip"
  handler       = "hello-world.handler"
  runtime       = "nodejs18.x"
  role          = "arn:aws:iam::123456789012:role/xxx"
}
