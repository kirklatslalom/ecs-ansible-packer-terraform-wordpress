// Required metadata
variable "region" {}

variable "env" {}

variable "app" {}

variable "account" {}

variable "profile" {}

variable "log-bucket" {
  default = "slalom-kirkl-logs"
}
