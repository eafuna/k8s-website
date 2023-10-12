variable "cluster_name" {
  type = string
}
variable "k8s_vpc_name" {
  type = string
  default = "YTL-MY-AWS-VPC- Container-NonProd"
}

variable "k8s_vpc_cidr_block" {
    type = string
    default = "10.75.0.0/16"
}

variable "k8s_aws_private_subnets" {
    type = map(object({
        cidr            = string
        subnet_tag_name = string
        az              = string
    }))

    default = {
      ap-southeast-1a-1 = {
        cidr            = "10.75.0.0/18"
        subnet_tag_name = "EKS-PubWeb-Stg-Pvt-Subnet 1a"
        az              = "ap-southeast-1a"
      },
      ap-southeast-1b-1 = {
        cidr            = "10.75.64.0/18"
        subnet_tag_name = "EKS-PubWeb-Stg-Pub-Subnet 1a"
        az              = "ap-southeast-1b"
      },
      ap-southeast-1a-3 = {
        cidr            = "10.75.128.0/18"
        subnet_tag_name = "EKS-DB-Stg-Subnet 1a"
        az              = "ap-southeast-1a"
      }
    }
}

variable "k8s_aws_public_subnets" {
    type = map(object({
        cidr            = string
        subnet_tag_name = string
        az              = string
    }))

    default = {
    }
}