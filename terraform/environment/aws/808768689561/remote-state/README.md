## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tf-state-bucket"></a> [tf-state-bucket](#module\_tf-state-bucket) | ../../../../../modules/aws-s3-tf-state-bucket/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | n/a | `any` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | n/a | `any` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_log-bucket"></a> [log-bucket](#input\_log-bucket) | n/a | `string` | `"slalom-kirkl-logs"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Required metadata | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket-logging"></a> [bucket-logging](#output\_bucket-logging) | n/a |
| <a name="output_bucket-replication"></a> [bucket-replication](#output\_bucket-replication) | n/a |
| <a name="output_bucket-server_side_encryption_configuration"></a> [bucket-server\_side\_encryption\_configuration](#output\_bucket-server\_side\_encryption\_configuration) | n/a |
| <a name="output_tf-remote-state-bucket-acl"></a> [tf-remote-state-bucket-acl](#output\_tf-remote-state-bucket-acl) | n/a |
| <a name="output_tf-remote-state-bucket-versioning"></a> [tf-remote-state-bucket-versioning](#output\_tf-remote-state-bucket-versioning) | n/a |
| <a name="output_tf-state-bucket"></a> [tf-state-bucket](#output\_tf-state-bucket) | n/a |
| <a name="output_tf-state-bucket-block"></a> [tf-state-bucket-block](#output\_tf-state-bucket-block) | n/a |
| <a name="output_tf-state-bucket-key"></a> [tf-state-bucket-key](#output\_tf-state-bucket-key) | n/a |
| <a name="output_tf-state-bucket-policy"></a> [tf-state-bucket-policy](#output\_tf-state-bucket-policy) | n/a |
| <a name="output_tf-state-bucket-replication-role"></a> [tf-state-bucket-replication-role](#output\_tf-state-bucket-replication-role) | n/a |
