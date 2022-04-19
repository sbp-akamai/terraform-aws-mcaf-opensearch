variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "opensearch"
}

variable "cluster_domain" {
  description = "The hosted zone name of the OpenSearch cluster."
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "The subnet id's to use for the OpenSearch cluster."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "The security group id's to add to the OpenSearch security group."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
