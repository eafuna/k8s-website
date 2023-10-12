
# variable "k8s_use_vpc_id" {
#     type = string    
#     default = "vpc-43b17925"
# }



variable "cluster_name" {
  default = "k8website"
  type = string
  description = "AWS EKS CLuster Name"
  nullable = false
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
        cidr            = "10.74.4.0/22"
        subnet_tag_name = "EKS-PubWeb-Stg-Pvt-Subnet 1a"
        az              = "ap-southeast-1a"
      },
      ap-southeast-1a-2 = {
        cidr            = "10.74.8.0/24"
        subnet_tag_name = "EKS-PubWeb-Stg-Pub-Subnet 1a"
        az              = "ap-southeast-1a"
      }
      ap-southeast-1a-3 = {
        cidr            = "10.74.9.0/24"
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


#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.0.0/19"
#   availability_zone = "us-east-1a"

#   tags = merge(local.tags, { Name = "private-us-east-1a" })
  
# }

# resource "aws_subnet" "private-us-east-1b" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.32.0/19"
#   availability_zone = "us-east-1b"

#   tags = merge(local.tags, { Name = "private-us-east-1b" })

