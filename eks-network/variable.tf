variable "k8s_common_tags" {
  type = map(string)
}

variable "environment" {
  type = string
}

variable "base_naming_standard" {
  type = string
  default = "VPC-Container"
}

variable "cluster_name" {
  type = string
}

# variable "k8s_vpc_name" {
#   type = string
#   default = "VPC-Container"
# }



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
      ap-southeast-pwb-1a = {
        cidr            = "10.75.4.0/22"
        subnet_tag_name = "EKS-PubWeb-Stg-Pvt-Subnet 1a"
        az              = "ap-southeast-1a"
      },
      ap-southeast-pwb-1b = {
        cidr            = "10.75.8.0/24"
        subnet_tag_name = "EKS-PubWeb-Stg-Pvt-Subnet 1b"
        az              = "ap-southeast-1b"
      },
    }

}

variable "k8s_aws_public_subnets" {
    type = map(object({
        cidr            = string
        subnet_tag_name = string
        az              = string
    }))

    default = {
      ap-southeast-pwb-1a = {
        cidr            = "10.75.128.0/24"
        subnet_tag_name = "EKS-PubWeb-Stg-Pub-Subnet 1a"
        az              = "ap-southeast-1a"
      }
      ap-southeast-pwb-1b = {
        cidr            = "10.75.129.0/24"
        subnet_tag_name = "EKS-PubWeb-Stg-Pub-Subnet 1b"
        az              = "ap-southeast-1b"
      }
    }
}

variable "k8s_aws_db_subnets" {
    type = map(object({
        cidr            = string
        subnet_tag_name = string
        az              = string
    }))

    default = {
      ap-southeast-1a-3 = {
        cidr            = "10.75.9.0/24"
        subnet_tag_name = "EKS-DB-Stg-Subnet 1a"
        az              = "ap-southeast-1a"
      }
    }
}