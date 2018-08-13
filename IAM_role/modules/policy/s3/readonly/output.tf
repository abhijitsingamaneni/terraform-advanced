output "s3_read_only_access" {
  value = "${aws_iam_policy.s3_read_only.arn}"
}
