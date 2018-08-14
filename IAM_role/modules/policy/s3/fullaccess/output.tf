# This is used to output arn for newly creared policy which can be later used variable for different modules
output "s3_full" {
  value = "${aws_iam_policy.s3_full_access.arn}"
}
