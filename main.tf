resource "aws_elasticsearch_domain" "opensearch" {
  domain_name           = var.cluster_name
  elasticsearch_version = var.cluster_version

  cluster_config {
    dedicated_master_enabled = var.master_instance_count > 0
    dedicated_master_count   = var.master_instance_count
    dedicated_master_type    = var.master_instance_type

    instance_count = var.hot_instance_count
    instance_type  = var.hot_instance_type

    warm_enabled = var.warm_enabled
    warm_count   = var.warm_enabled ? var.warm_instance_count : null
    warm_type    = var.warm_enabled ? var.warm_instance_type : null

    zone_awareness_enabled = (var.availability_zones > 1) ? true : false

    zone_awareness_config {
      availability_zone_count = var.availability_zones
    }
  }

  log_publishing_options {
    enabled                  = var.cloudwatch_log_enabled
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.cw_index.arn
    log_type                 = "INDEX_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = var.cloudwatch_log_enabled
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.cw_search.arn
    log_type                 = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = var.cloudwatch_log_enabled
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.cw_application.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }

  log_publishing_options {
    enabled                  = var.cloudwatch_log_enabled
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.cw_audit.arn
    log_type                 = "AUDIT_LOGS"
  }

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = var.internal_user_database_enabled
    master_user_options {
      master_user_arn = var.master_user_arn
    }
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption
  }

  encrypt_at_rest {
    enabled    = var.encrypt_at_rest
    kms_key_id = var.encrypt_at_rest ? var.encrypt_kms_key_id : null
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_enabled ? var.ebs_volume_size : null
    volume_type = var.ebs_enabled ? var.ebs_volume_type : null
    iops        = var.ebs_enabled ? var.ebs_iops : null
  }

  domain_endpoint_options {
    enforce_https                   = var.enforce_https
    tls_security_policy             = var.tls_security_policy
    custom_endpoint_enabled         = var.custom_endpoint_enabled
    custom_endpoint                 = var.custom_endpoint_enabled ? var.custom_endpoint : null
    custom_endpoint_certificate_arn = var.custom_endpoint_enabled ? var.custom_endpoint_certificate_arn : null
  }

  cognito_options {
    enabled          = var.cognito_enabled
    user_pool_id     = var.cognito_enabled ? var.cognito_user_pool_id : ""
    identity_pool_id = var.cognito_enabled ? var.cognito_identity_pool_id : ""
    role_arn         = var.cognito_enabled ? var.cognito_role_arn : ""
  }

  tags = var.tags
}

resource "aws_elasticsearch_domain_saml_options" "opensearch_saml_options" {
  domain_name = var.cluster_name
  saml_options {
    enabled = var.saml_options_enabled
    idp {
      entity_id        = var.entity_id
      metadata_content = var.metadata_content
    }
  }
}