resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-server_side_encryption_configuration" {
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terraform-remote-state-bucket-key.id
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "tf-remote-state-bucket-acl" {
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf-remote-state-bucket-versioning" {
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "bucket-logging" {
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id

  target_bucket = data.aws_s3_bucket.selected.id
  target_prefix = "log/"
}

resource "aws_iam_role" "replication_role" {
  name = "tf-iam-role-replication"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_replication_configuration" "bucket-replication" {
  # Must have bucket versioning enabled first
  #depends_on = [
  #  aws_s3_bucket_versioning.tf-remote-state-bucket-versioning.id]

  role   = aws_iam_role.replication_role.arn
  bucket = aws_s3_bucket.terraform-remote-state-bucket.id

  rule {
    id     = "foobar"
    prefix = "foo"
    status = "Enabled"

    destination {
      bucket        = data.aws_s3_bucket.selected.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_iam_policy" "replication_policy" {
  name = "tf-iam-role-policy-replication"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.terraform-remote-state-bucket.id}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
         "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.terraform-remote-state-bucket.id}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Effect": "Allow",
      "Resource": "${data.aws_s3_bucket.selected.id}/*"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.id
}
