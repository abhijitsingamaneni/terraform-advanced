data "aws_iam_policy_document" "s3_full_access" {
  statement {
    "effect"="Allow",
    "actions"=[
        "s3:*"
    ],
    "resources"=[
        "*"
    ]
  }
}

resource "aws_iam_policy" "s3_full_access" {
  name   = "s3_full_access"
  path   = "/"
  policy = "${data.aws_iam_policy_document.s3_full_access.json}"
}
