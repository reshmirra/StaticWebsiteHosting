terraform {
    required_version = ">= 1.6.0"
required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }
}
}


provider "aws" {
    region = var.region #primary region
  
}

provider "aws" {
  region = "us-east-1" #secondary region for cloudfront edge location
  alias = "use1"
}