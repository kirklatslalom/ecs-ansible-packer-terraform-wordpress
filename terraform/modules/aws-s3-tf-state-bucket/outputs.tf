output "tf-state-bucket" {
  value = aws_s3_bucket.terraform-remote-state-bucket
}

output "tf-state-bucket-key" {
  value     = aws_kms_key.terraform-remote-state-bucket-key
  sensitive = true
}

output "tf-state-bucket-replication-role" {
  value = aws_iam_role.replication_role
}

output "tf-state-bucket-policy" {
  value = aws_iam_policy.replication_policy
}

output "tf-state-bucket-block" {
  value = aws_s3_bucket_public_access_block.bucket-never-public
}

output "bucket-server_side_encryption_configuration" {
  value = aws_s3_bucket_server_side_encryption_configuration.bucket-server_side_encryption_configuration.id
}

output "tf-remote-state-bucket-acl" {
  value = aws_s3_bucket_acl.tf-remote-state-bucket-acl.id
}

output "tf-remote-state-bucket-versioning" {
  value = aws_s3_bucket_versioning.tf-remote-state-bucket-versioning.id
}

output "bucket-logging" {
  value = aws_s3_bucket_logging.bucket-logging.id
}

output "bucket-replication" {
  value = aws_s3_bucket_replication_configuration.bucket-replication.id
}
