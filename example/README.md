# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |
| elasticsearch | >=2.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_domain | The hosted zone name of the OpenSearch cluster. | `string` | `""` | no |
| cluster\_name | The name of the OpenSearch cluster. | `string` | `"opensearch"` | no |
| security\_group\_ids | The security group id's to add to the OpenSearch security group. | `list(string)` | `[]` | no |
| subnet\_ids | The subnet id's to use for the OpenSearch cluster. | `list(string)` | `[]` | no |
| tags | Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_endpoint | The endpoint URL of the OpenSearch cluster. |
| cluster\_name | The name of the OpenSearch cluster. |
| cluster\_version | The version of the OpenSearch cluster. |

<!--- END_TF_DOCS --->
