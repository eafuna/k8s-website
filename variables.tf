
variable "cluster_name" {
  default = "k8s_website"
  type = string
  description = "AWS EKS CLuster Name"
  nullable = false
}


variable "k8s_vpc_cidr_block" {
    type = string
    default = ""
}

variable "k8s_use_vpc_id" {
    type = string    
    default = "vpc-43b17925"
}


variable "k8s_aws_public_subnets" {
    type = map(object({
        cidr = string
        subnet_tag_name = string
    }))

    default = {
      us-east-1a = {
        cidr = "10.0.32.0/19"
        subnet_tag_name = "public-us-east-1a"
      },
      us-east-1b = {
        cidr = "10.0.96.0/19"
        subnet_tag_name = "public-us-east-1b"
      }
    }
}


variable "k8s_aws_private_subnets" {
    type = map(object({
        cidr = string
        subnet_tag_name = string
    }))

    default = {
      us-east-1a = {
        cidr = "10.0.0.0/19"
        subnet_tag_name = "private-us-east-1a"
      },
      us-east-1b = {
        cidr = "10.0.32.0/19"
        subnet_tag_name = "private-us-east-1b"
      }
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

