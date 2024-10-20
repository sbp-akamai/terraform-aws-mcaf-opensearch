variable "enabled" {
  description = "Enable OpenSearch."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "opensearch"
}

variable "cluster_version" {
  description = "The version of OpenSearch to deploy."
  type        = string
  default     = "OpenSearch_1.2"
}

variable "cluster_domain_name" {
  description = "The domain name for the OpenSearch cluster."
  type        = string
  default     = null
}

variable "master_instance_count" {
  description = "The number of dedicated master nodes in the cluster."
  type        = number
  default     = 3
}

variable "master_instance_type" {
  type        = string
  description = "Instance type for the OpenSearch master nodes."
  default     = "t3.small.elasticsearch"
}

variable "hot_instance_count" {
  description = "The number of dedicated hot nodes in the cluster."
  type        = number
  default     = 3
}

variable "hot_instance_type" {
  description = "The instance type for dedicated hot nodes in the cluster."
  type        = string
  default     = "t3.small.elasticsearch"
}

variable "warm_enabled" {
  description = "Enable warm nodes."
  type        = bool
  default     = false
}

variable "warm_instance_type" {
  description = "The type of EC2 instances to run for each warm node."
  type        = string
  default     = "ultrawarm1.medium.elasticsearch"
}

variable "warm_instance_count" {
  description = "The number of dedicated warm nodes in the cluster."
  type        = number
  default     = 3
}

variable "cold_enabled" {
  description = "Enable cold storage."
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3."
  type        = number
  default     = 3
}

variable "ebs_enabled" {
  description = "Enable EBS volumes for data nodes"
  type        = bool
  default     = false
}

variable "ebs_iops" {
  description = "Baseline I/O performance of EBS volumes attached to data nodes."
  type        = number
  default     = null
}
variable "ebs_volume_size" {
  description = "EBS Volume size in GiB"
  type        = number
  default     = null
}

variable "ebs_volume_type" {
  description = "EBS volume type. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC id where to deploy the OpenSearch cluster."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "The subnet id where to deploy the OpenSearch cluster."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of VPC security group id's."
  type        = list(string)
  default     = []
}

variable "enforce_https" {
  description = "Enforce HTTPS domain endpoint."
  type        = string
  default     = null
}

variable "tls_security_policy" {
  description = "Name of TLS security policy to use at HTTPS endpoint."
  type        = string
  default     = "Policy-Min-TLS-1-2-2019-07"

  validation {
    condition     = can(regex("^Policy-Min-TLS-1-0-2019-07|Policy-Min-TLS-1-2-2019-07|Policy-Min-TLS-1-2-PFS-2023-10$", var.tls_security_policy))
    error_message = "TLS security policy should be 'Policy-Min-TLS-1-0-2019-07, Policy-Min-TLS-1-2-2019-07, Policy-Min-TLS-1-2-PFS-2023-10'."
  }
}

variable "custom_endpoint_enabled" {
  description = "Enable custom endpoint."
  type        = bool
  default     = false
}

variable "custom_endpoint" {
  description = "FQDN of the custom endpoint"
  type        = string
  default     = null
}

variable "custom_endpoint_certificate_arn" {
  description = "ACM certificate ARN for your custom endpoint."
  type        = string
  default     = null
}

variable "internal_user_database_enabled" {
  description = "Enable internal user database."
  type        = bool
  default     = true
}

variable "master_user_arn" {
  description = "ARN of the main user."
  type        = string
  default     = null
}

variable "master_user_name" {
  description = "Name of the main user."
  type        = string
  default     = null
}

variable "master_user_password" {
  description = "Password of the main user."
  type        = string
  default     = null
}

variable "encrypt_kms_key_id" {
  description = "KMS key id to encrypt OpenSearch domain with."
  type        = string
  default     = null
}

variable "cloudwatch_log_enabled" {
  description = "Enabled Cloudwatch."
  type        = bool
  default     = true
}

variable "cloudwatch_log_retention" {
  description = "Cloudwatch log retention in days."
  type        = number
  default     = 365
}

variable "cloudwatch_log_kms_key_id" {
  description = "The ARN of the KMS key to use when encrypting log data."
  type        = string
  default     = null
}

variable "node_to_node_encryption" {
  description = "Enable node-to-node encryption."
  type        = bool
  default     = true
}

variable "encrypt_at_rest" {
  description = "Enable encryption at rest"
  type        = bool
  default     = true
}

variable "cognito_enabled" {
  description = "Enable AWS cognito for OpenSearch."
  type        = bool
  default     = false
}

variable "cognito_user_pool_id" {
  description = "ID of the Cognito user pool to use."
  type        = string
  default     = null
}

variable "cognito_identity_pool_id" {
  description = "ID of the Cognito identity pool to use."
  type        = string
  default     = null
}

variable "cognito_role_arn" {
  description = "ARN of the IAM role that has the AmazonESCognitoAccess policy."
  type        = string
  default     = null
}

variable "saml_options_enabled" {
  description = "Enable saml_options"
  type        = bool
  default     = false
}
variable "saml_options_master_backend_role" {
  description = "(Optional) This backend role from the SAML IdP receives full permissions to the cluster, equivalent to a new master user."
  type        = string
  default     = null
}
variable "saml_options_master_user_name" {
  description = "(Optional) This username from the SAML IdP receives full permissions to the cluster, equivalent to a new master user."
  type        = string
  default     = null
}
variable "saml_options_roles_key" {
  description = "(Optional) Element of the SAML assertion to use for backend roles. Default is roles. e.g. http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"
  type        = string
  default     = null
}
variable "saml_options_subject_key" {
  description = "(Optional) Custom SAML attribute to use for user names. Default is an empty string. This will cause Elasticsearch to use the NameID element of the Subject, which is the default location for name identifiers in the SAML specification."
  type        = string
  default     = null
}
variable "saml_options_session_timeout_minutes" {
  description = "(Optional) Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440."
  type        = number
  default     = null
}
variable "saml_options_idp_entity_id" {
  description = "URL of the entity id"
  type        = string
  default     = null
}

variable "saml_options_idp_metadata_content" {
  type        = string
  description = "Contents of the saml-metadata.xml file"
  default     = null
}

variable "autotune_enabled" {
  type        = bool
  description = "Enable autotune options"
  default     = false
}

variable "autotune_options" {
  type = object({
    desired_state       = string
    rollback_on_disable = string
    maintenance_schedule = object({
      cron_expression = string
      duration        = number
      start_at        = string
    })
  })
  default = {
    desired_state       = "ENABLED"
    rollback_on_disable = "NO_ROLLBACK"
    maintenance_schedule = {
      cron_expression = "cron(0 0 ? * 1 *)"
      duration        = 1
      start_at        = "2000-01-01T00:00:00.00Z"
    }
  }
  validation {
    condition     = can(regex("^DEFAULT_ROLLBACK|NO_ROLLBACK$", var.autotune_options.rollback_on_disable))
    error_message = "Autotune rollback_on_disable should be 'DEFAULT_ROLLBACK' or 'NO_ROLLBACK'."
  }
  validation {
    condition     = can(regex("^ENABLED|DISABLED$", var.autotune_options.desired_state))
    error_message = "Autotune desired_state should be 'ENABLED' or 'DISABLED'."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the OpenSearch cluster."
  default     = {}
}
