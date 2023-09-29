1. Install localstack CLI 
2. Run `localstack start`
3. Run `terraform init`
4. Run `terraform apply`
5. Invoke the lambda function using AWS
    a. Run `aws --endpoint-url lambda invoke --function-name hello-world --payload '{}' output.txt`
6. Observe the result in the /output.txt file
    a. `{"statusCode":200,"body":"Hello World!"}`