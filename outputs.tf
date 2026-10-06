output "opensearch_domain_arn" {
  description = "Return ARN of the OpenSearch cluster domain."
  value       = aws_opensearch_domain.opensearch[*].arn
}

output "opensearch_domain_id" {
  description = "The domain id of the OpenSearch cluster."
  value       = aws_opensearch_domain.opensearch[*].id
}

output "cluster_name" {
  description = "The name of the OpenSearch cluster."
  value       = aws_opensearch_domain.opensearch[*].domain_name
}

output "cluster_endpoint" {
  description = "The endpoint URL of the OpenSearch cluster."
  value       = aws_opensearch_domain.opensearch[*].endpoint
}

output "cluster_version" {
  description = "The version of the OpenSearch cluster."
  value       = [for i in aws_opensearch_domain.opensearch[*] : replace(i.engine_version, "OpenSearch_", "")]
}

output "kibana_endpoint" {
  description = "The endpoint URL of Kibana."
  value       = aws_opensearch_domain.opensearch[*].dashboard_endpoint
}
