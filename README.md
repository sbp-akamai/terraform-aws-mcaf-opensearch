## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.49.0 |
| <a name="requirement_elasticsearch"></a> [elasticsearch](#requirement\_elasticsearch) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cw_application](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.cw_audit](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.cw_index](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.cw_search](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.cw_resource_policy](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_elasticsearch_domain.opensearch](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/elasticsearch_domain) | resource |
| [aws_elasticsearch_domain_saml_options.opensearch_saml_options](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/resources/elasticsearch_domain_saml_options) | resource |
| [aws_iam_policy_document.cw_policy](https://registry.terraform.io/providers/hashicorp/aws/5.49.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autotune_enabled"></a> [autotune\_enabled](#input\_autotune\_enabled) | Enable autotune options | `bool` | `false` | no |
| <a name="input_autotune_options"></a> [autotune\_options](#input\_autotune\_options) | n/a | <pre>object({<br>    desired_state       = string<br>    rollback_on_disable = string<br>    maintenance_schedule = object({<br>      cron_expression = string<br>      duration        = number<br>      start_at        = string<br>    })<br>  })</pre> | <pre>{<br>  "desired_state": "ENABLED",<br>  "maintenance_schedule": {<br>    "cron_expression": "cron(0 0 ? * 1 *)",<br>    "duration": 1,<br>    "start_at": "2000-01-01T00:00:00.00Z"<br>  },<br>  "rollback_on_disable": "NO_ROLLBACK"<br>}</pre> | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3. | `number` | `3` | no |
| <a name="input_cloudwatch_log_enabled"></a> [cloudwatch\_log\_enabled](#input\_cloudwatch\_log\_enabled) | Enabled Cloudwatch. | `bool` | `true` | no |
| <a name="input_cloudwatch_log_kms_key_id"></a> [cloudwatch\_log\_kms\_key\_id](#input\_cloudwatch\_log\_kms\_key\_id) | The ARN of the KMS key to use when encrypting log data. | `string` | `null` | no |
| <a name="input_cloudwatch_log_retention"></a> [cloudwatch\_log\_retention](#input\_cloudwatch\_log\_retention) | Cloudwatch log retention in days. | `number` | `365` | no |
| <a name="input_cluster_domain_name"></a> [cluster\_domain\_name](#input\_cluster\_domain\_name) | The domain name for the OpenSearch cluster. | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the OpenSearch cluster. | `string` | `"opensearch"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of OpenSearch to deploy. | `string` | `"OpenSearch_1.2"` | no |
| <a name="input_cognito_enabled"></a> [cognito\_enabled](#input\_cognito\_enabled) | Enable AWS cognito for OpenSearch. | `bool` | `false` | no |
| <a name="input_cognito_identity_pool_id"></a> [cognito\_identity\_pool\_id](#input\_cognito\_identity\_pool\_id) | ID of the Cognito identity pool to use. | `string` | `null` | no |
| <a name="input_cognito_role_arn"></a> [cognito\_role\_arn](#input\_cognito\_role\_arn) | ARN of the IAM role that has the AmazonESCognitoAccess policy. | `string` | `null` | no |
| <a name="input_cognito_user_pool_id"></a> [cognito\_user\_pool\_id](#input\_cognito\_user\_pool\_id) | ID of the Cognito user pool to use. | `string` | `null` | no |
| <a name="input_cold_enabled"></a> [cold\_enabled](#input\_cold\_enabled) | Enable cold storage. | `bool` | `false` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | FQDN of the custom endpoint | `string` | `null` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | ACM certificate ARN for your custom endpoint. | `string` | `null` | no |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | Enable custom endpoint. | `bool` | `false` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Enable EBS volumes for data nodes | `bool` | `false` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | Baseline I/O performance of EBS volumes attached to data nodes. | `number` | `null` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS Volume size in GiB | `number` | `null` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | EBS volume type. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable OpenSearch. | `bool` | `true` | no |
| <a name="input_encrypt_at_rest"></a> [encrypt\_at\_rest](#input\_encrypt\_at\_rest) | Enable encryption at rest | `bool` | `true` | no |
| <a name="input_encrypt_kms_key_id"></a> [encrypt\_kms\_key\_id](#input\_encrypt\_kms\_key\_id) | KMS key id to encrypt OpenSearch domain with. | `string` | `null` | no |
| <a name="input_enforce_https"></a> [enforce\_https](#input\_enforce\_https) | Enforce HTTPS domain endpoint. | `string` | `null` | no |
| <a name="input_hot_instance_count"></a> [hot\_instance\_count](#input\_hot\_instance\_count) | The number of dedicated hot nodes in the cluster. | `number` | `3` | no |
| <a name="input_hot_instance_type"></a> [hot\_instance\_type](#input\_hot\_instance\_type) | The instance type for dedicated hot nodes in the cluster. | `string` | `"t3.small.elasticsearch"` | no |
| <a name="input_internal_user_database_enabled"></a> [internal\_user\_database\_enabled](#input\_internal\_user\_database\_enabled) | Enable internal user database. | `bool` | `true` | no |
| <a name="input_master_instance_count"></a> [master\_instance\_count](#input\_master\_instance\_count) | The number of dedicated master nodes in the cluster. | `number` | `3` | no |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | Instance type for the OpenSearch master nodes. | `string` | `"t3.small.elasticsearch"` | no |
| <a name="input_master_user_arn"></a> [master\_user\_arn](#input\_master\_user\_arn) | ARN of the main user. | `string` | `null` | no |
| <a name="input_master_user_name"></a> [master\_user\_name](#input\_master\_user\_name) | Name of the main user. | `string` | `null` | no |
| <a name="input_master_user_password"></a> [master\_user\_password](#input\_master\_user\_password) | Password of the main user. | `string` | `null` | no |
| <a name="input_node_to_node_encryption"></a> [node\_to\_node\_encryption](#input\_node\_to\_node\_encryption) | Enable node-to-node encryption. | `bool` | `true` | no |
| <a name="input_saml_options_enabled"></a> [saml\_options\_enabled](#input\_saml\_options\_enabled) | Enable saml\_options | `bool` | `false` | no |
| <a name="input_saml_options_idp_entity_id"></a> [saml\_options\_idp\_entity\_id](#input\_saml\_options\_idp\_entity\_id) | URL of the entity id | `string` | `null` | no |
| <a name="input_saml_options_idp_metadata_content"></a> [saml\_options\_idp\_metadata\_content](#input\_saml\_options\_idp\_metadata\_content) | Contents of the saml-metadata.xml file | `string` | `null` | no |
| <a name="input_saml_options_master_backend_role"></a> [saml\_options\_master\_backend\_role](#input\_saml\_options\_master\_backend\_role) | (Optional) This backend role from the SAML IdP receives full permissions to the cluster, equivalent to a new master user. | `string` | `null` | no |
| <a name="input_saml_options_master_user_name"></a> [saml\_options\_master\_user\_name](#input\_saml\_options\_master\_user\_name) | (Optional) This username from the SAML IdP receives full permissions to the cluster, equivalent to a new master user. | `string` | `null` | no |
| <a name="input_saml_options_roles_key"></a> [saml\_options\_roles\_key](#input\_saml\_options\_roles\_key) | (Optional) Element of the SAML assertion to use for backend roles. Default is roles. e.g. http://schemas.microsoft.com/ws/2008/06/identity/claims/groups | `string` | `null` | no |
| <a name="input_saml_options_session_timeout_minutes"></a> [saml\_options\_session\_timeout\_minutes](#input\_saml\_options\_session\_timeout\_minutes) | (Optional) Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440. | `number` | `null` | no |
| <a name="input_saml_options_subject_key"></a> [saml\_options\_subject\_key](#input\_saml\_options\_subject\_key) | (Optional) Custom SAML attribute to use for user names. Default is an empty string. This will cause Elasticsearch to use the NameID element of the Subject, which is the default location for name identifiers in the SAML specification. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of VPC security group id's. | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet id where to deploy the OpenSearch cluster. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the OpenSearch cluster. | `map(string)` | `{}` | no |
| <a name="input_tls_security_policy"></a> [tls\_security\_policy](#input\_tls\_security\_policy) | Name of TLS security policy to use at HTTPS endpoint. | `string` | `"Policy-Min-TLS-1-2-2019-07"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id where to deploy the OpenSearch cluster. | `string` | `null` | no |
| <a name="input_warm_enabled"></a> [warm\_enabled](#input\_warm\_enabled) | Enable warm nodes. | `bool` | `false` | no |
| <a name="input_warm_instance_count"></a> [warm\_instance\_count](#input\_warm\_instance\_count) | The number of dedicated warm nodes in the cluster. | `number` | `3` | no |
| <a name="input_warm_instance_type"></a> [warm\_instance\_type](#input\_warm\_instance\_type) | The type of EC2 instances to run for each warm node. | `string` | `"ultrawarm1.medium.elasticsearch"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint URL of the OpenSearch cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the OpenSearch cluster. |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The version of the OpenSearch cluster. |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | The endpoint URL of Kibana. |
| <a name="output_opensearch_domain_arn"></a> [opensearch\_domain\_arn](#output\_opensearch\_domain\_arn) | Return ARN of the OpenSearch cluster domain. |
| <a name="output_opensearch_domain_id"></a> [opensearch\_domain\_id](#output\_opensearch\_domain\_id) | The domain id of the OpenSearch cluster. |
