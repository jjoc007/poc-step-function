resource "aws_lambda_function" "number_generator_lambda" {
  filename      =  data.archive_file.number_generator.output_path
  source_code_hash = data.archive_file.number_generator.output_base64sha256
  function_name = "poc_number_generator_lambda"
  role          = aws_iam_role.example_lambda_role.arn
  handler       = "1_number_generator/main.handler"
  runtime = "nodejs18.x"
}

resource "aws_lambda_function" "even_lambda" {
  filename      =  data.archive_file.even.output_path
  source_code_hash = data.archive_file.even.output_base64sha256
  function_name = "poc_even_lambda"
  role          = aws_iam_role.example_lambda_role.arn
  handler       = "2_even/main.handler"
  runtime = "nodejs18.x"
}

resource "aws_lambda_function" "odd_lambda" {
  filename      =  data.archive_file.odd.output_path
  source_code_hash = data.archive_file.odd.output_base64sha256
  function_name = "poc_odd_lambda"
  role          = aws_iam_role.example_lambda_role.arn
  handler       = "3_odd/main.handler"
  runtime = "nodejs18.x"
}