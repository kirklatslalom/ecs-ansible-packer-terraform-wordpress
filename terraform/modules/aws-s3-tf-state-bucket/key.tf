resource "aws_kms_key" "terraform-remote-state-bucket-key" {
  enable_key_rotation = true
}
