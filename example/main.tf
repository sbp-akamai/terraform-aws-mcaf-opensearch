locals {
  cluster_name       = "opensearch"
  cluster_domain     = "example.com"
  subnet_ids         = ["subnet-0dae45a1eb7c9fdf3", "subnet-001513fc666d1942e", "subnet-0dd4d27954f054a39"]
  security_group_ids = ["sg-0ce251adb660f4327"]
}

data "aws_region" "current" {}

provider "elasticsearch" {
  url         = "https://${var.cluster_name}.${var.cluster_domain_name}"
  aws_region  = data.aws_region.current.name
  healthcheck = false
}

module "opensearch" {
  source = "../"

  cluster_name = local.cluster_name
  # cluster_domain  = var.cluster_domain_name
  cluster_version = "OpenSearch_1.2"

  subnet_ids         = local.subnet_ids
  security_group_ids = local.security_group_ids

  warm_enabled    = false
  master_user_arn = "arn:aws:iam::758793629524:user/averhaar"

  ebs_enabled     = true
  ebs_volume_size = 50

  cloudwatch_log_enabled = true
}
