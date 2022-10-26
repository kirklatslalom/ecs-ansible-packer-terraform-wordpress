output "tf-state-bucket" {
  value = module.tf-state-bucket.tf-state-bucket
}

output "tf-state-bucket-key" {
  value     = module.tf-state-bucket.tf-state-bucket-key
  sensitive = true
}

output "tf-state-bucket-replication-role" {
  value = module.tf-state-bucket.tf-state-bucket-replication-role
}

output "tf-state-bucket-block" {
  value = module.tf-state-bucket.tf-state-bucket-block
}

output "tf-state-bucket-policy" {
  value = module.tf-state-bucket.tf-state-bucket-policy
}

output "tf-remote-state-bucket-versioning" {
  value = module.tf-state-bucket.tf-remote-state-bucket-versioning
}

output "bucket-replication" {
  value = module.tf-state-bucket.bucket-replication
}

output "bucket-logging" {
  value = module.tf-state-bucket.bucket-logging
}

output "tf-remote-state-bucket-acl" {
  value = module.tf-state-bucket.tf-remote-state-bucket-acl
}

output "bucket-server_side_encryption_configuration" {
  value = module.tf-state-bucket.bucket-server_side_encryption_configuration
}
