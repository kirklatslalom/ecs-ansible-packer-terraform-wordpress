module "tf-state-bucket" {
  source = "../../../../../modules/aws-s3-tf-state-bucket/"

  bucket-name = "tf-state-${var.account}"
}
