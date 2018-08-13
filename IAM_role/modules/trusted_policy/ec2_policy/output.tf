output "ec2_policy" {
  value = "${data.aws_iam_policy_document.instance-assume-role-policy.json}"
}
