data "aws_iam_policy_document" "s3_read_only" {
  statement {
    "effect"="Allow",
    "actions"=[
        "s3:list*"
    ],
    "resources"=[
        "*"
    ]
  }
}

resource "aws_iam_policy" "s3_read_only" {
  name   = "s3_read_only"
  path   = "/"
  policy = "${data.aws_iam_policy_document.s3_read_only.json}"
}
