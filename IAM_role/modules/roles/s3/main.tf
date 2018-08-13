resource "aws_iam_role" "s3_access" {
  name               = "s3_access"
  assume_role_policy = "${var.trusted_policy}"
}

resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = "${aws_iam_role.s3_access.name}"
  count      = "${var.policy_count}"
  policy_arn = "${var.policy[count.index]}"
}
