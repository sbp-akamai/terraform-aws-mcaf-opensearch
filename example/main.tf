data "aws_region" "current" {}

provider "elasticsearch" {
  url         = "https://${var.cluster_name}.${var.cluster_domain}"
  aws_region  = data.aws_region.current.name
  healthcheck = false
}

module "opensearch" {
  source = "../"

  enabled = true

  cluster_name    = var.cluster_name
  cluster_version = "OpenSearch_2.7"

  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids

  warm_enabled = false

  ebs_enabled     = true
  ebs_volume_size = 50

  saml_options_enabled = false

  cloudwatch_log_enabled = true
}
