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

variable "ebs_volume_size" {
  description = "EBS Volume size in GiB"
  type        = number
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
    condition     = can(regex("^Policy-Min-TLS-1-0-2019-07|Policy-Min-TLS-1-2-2019-07$", var.tls_security_policy))
    error_message = "TLS security policy should be 'Policy-Min-TLS-1-0-2019-07' or 'Policy-Min-TLS-1-2-2019-07'."
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

variable "master_user_arn" {
  description = "ARN of the main user."
  type        = string
  default     = null
}

variable "encrypt_kms_key_id" {
  description = "KMS key id to encrypt OpenSearch domain with."
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the OpenSearch cluster."
  default     = {}
}
