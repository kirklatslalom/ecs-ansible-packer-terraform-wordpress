resource "aws_s3_bucket" "terraform-remote-state-bucket" {
  bucket        = var.bucket-name
  force_destroy = true
}
