terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = ">= 2.0.0"
    }
  }
}
