#Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. 
#Use of data sources allows a Terraform configuration to build on information defined outside of Terraform, 
#or defined by another separate Terraform configuration.
# Thanks to terraform docs https://www.terraform.io/docs/configuration/data-sources.html
# so we are using this data soure to call the data into aws_iam_policy resource
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

# This resource is used to create a new policy using data
resource "aws_iam_policy" "s3_full_access" {
  name   = "s3_full_access"
  path   = "/"
  policy = "${data.aws_iam_policy_document.s3_full_access.json}"
}
