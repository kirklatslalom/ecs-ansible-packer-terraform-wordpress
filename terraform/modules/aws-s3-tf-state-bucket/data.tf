data "aws_s3_bucket" "selected" {
  bucket = var.log-bucket
}
