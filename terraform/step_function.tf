# Step Functions State Machine
resource "aws_sfn_state_machine" "number_processor_sf" {
  name     = "NumberProcessorSF"
  role_arn = aws_iam_role.step_functions_role.arn

  definition = <<EOF
{
  "Comment": "Ejecuta las Lambdas según si el número es par o impar",
  "StartAt": "NumberGenerator",
  "States": {
    "NumberGenerator": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.number_generator_lambda.arn}",
      "Next": "IsNumberEven"
    },
    "IsNumberEven": {
      "Type": "Choice",
      "Choices": [
        {
          "Variable": "$.is_even",
          "BooleanEquals": true,
          "Next": "Even"
        }
      ],
      "Default": "Odd"
    },
    "Even": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.even_lambda.arn}",
      "End": true
    },
    "Odd": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.odd_lambda.arn}",
      "End": true
    }
  }
}
EOF
}