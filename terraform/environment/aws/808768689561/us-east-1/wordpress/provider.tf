provider "aws" {
  profile                 = var.profile
  region                  = var.region
  shared_credentials_file = pathexpand(var.shared_credentials_file)
}

provider "aws" {
  alias                 = "us-east-1"
  region                = "us-east-1"
  configuration_aliases = [aws]
}
