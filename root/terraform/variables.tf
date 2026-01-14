variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1"
} 
variable "kubeconfig_path" {
  description = "path to kubeconfig file for kubernetes authentication"
  type        = string
  default = "~/.kube/config"
}

variable "ingress_nginx_namespace" {
    description = "namespace for the NGINX ingress Controller"
    type        = string
    default     = "ingress-nginx"
}

locals {
    cluster_name = "e2ecicd-eks-${var.environment}"

    vpc_cidrs = {
        dev     = "10.0.0.0/16"
        staging = "10.1.0.0/16"
        prod    = "10.2.0.0/16"
    }
}

private_subnets = {
    dev     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    staging = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
    prod    = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"] 

}

public_subnets = {
    dev     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
    staging = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
    prod    = ["10.2.10.0/24", "10.2.20.0/24", "10.2.30.0/24"]
}

instance_type = {
    dev     = "t3.medium"
    staging = "t3.large"
    prod    = "t3.xlarge"
}

desired_instance_count = {
    dev     = 2
    staging = 3
    prod    = 4
}