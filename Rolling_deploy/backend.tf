terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "s3_bucket"
    region         = "us-west-2"
    key            = "terraform.tfstate"
  }
}
