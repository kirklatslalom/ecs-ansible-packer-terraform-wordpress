provider "aws" {
  profile                  = var.profile
  region                   = var.region
  shared_credentials_files = [pathexpand(var.shared_credentials_file)]
}

provider "aws" {
  alias                   = "us-east-1"
  region                  = "us-east-1"
  configuration_aliases   = [aws]
  shared_credentials_file = "~/.aws/credentials"
}

provider "awscc" {
  profile                  = var.profile
  region                   = "us-east-1"
  shared_credentials_files = [pathexpand(var.shared_credentials_file)]
}
