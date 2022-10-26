resource "aws_s3_bucket_public_access_block" "bucket-never-public" {
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
