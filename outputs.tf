output "opensearch_domain_arn" {
  value = aws_elasticsearch_domain.opensearch.arn
}

output "opensearch_domain_id" {
  value = aws_elasticsearch_domain.opensearch.id
}

output "cluster_name" {
  description = "The name of the OpenSearch cluster."
  value       = aws_elasticsearch_domain.opensearch.domain_name
}

output "cluster_endpoint" {
  description = "The endpoint URL of the OpenSearch cluster."
  value       = aws_elasticsearch_domain.opensearch.endpoint
}

output "cluster_version" {
  description = "The version of the OpenSearch cluster."
  value       = replace(aws_elasticsearch_domain.opensearch.elasticsearch_version, "OpenSearch_", "")
}

output "kibana_endpoint" {
  description = "The endpoint URL of Kibana."
  value       = aws_elasticsearch_domain.opensearch.kibana_endpoint
}

output "vpc_options_availability_zones" {
  value = aws_elasticsearch_domain.opensearch.vpc_options.0.availability_zones
}

output "vpc_options_vpc_id" {
  value = aws_elasticsearch_domain.opensearch.vpc_options.0.vpc_id
}
