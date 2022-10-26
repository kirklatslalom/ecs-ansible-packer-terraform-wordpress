data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    profile = var.profile
    region  = "us-west-1"
    bucket  = "tfstate-bucket-808768689561"
    key     = "state/vpc/prod/us-east-1/infrastructure.tfstate"
    encrypt = "true"
  }
}
