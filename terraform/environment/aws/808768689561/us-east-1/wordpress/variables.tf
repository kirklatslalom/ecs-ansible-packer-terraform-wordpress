// Required metadata
variable "region" {}
variable "env" {}
variable "app" {}
variable "account" {}
variable "profile" {}
variable "shared_credentials_file" {
  default = "~/.aws/credentials"
}
