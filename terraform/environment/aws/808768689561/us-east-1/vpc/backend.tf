terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    region = us-west-1
  }
}
