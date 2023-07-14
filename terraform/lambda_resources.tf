data "archive_file" "number_generator" {
  type        = "zip"
  source_dir = "../lambdas/1_number_generator/"
  output_path = "../lambdas/dist/1_number_generator.zip"
}

data "archive_file" "even" {
  type        = "zip"
  source_dir = "../lambdas/2_even/"
  output_path = "../lambdas/dist/2_even.zip"
}

data "archive_file" "odd" {
  type        = "zip"
  source_dir = "../lambdas/3_odd/"
  output_path = "../lambdas/dist/3_odd.zip"
}