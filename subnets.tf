locals {
  # tags = {
  #   "kubernetes.io/role/internal-elb" = "1"
  #   "kubernetes.io/cluster/demo"      = "owned"
  # }  
  tags = {}
}

# resource "aws_subnet" "k8s-private-subnet" {
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
# }

resource "aws_subnet" "k8s_public_subnet" {

  for_each = var.k8s_aws_public_subnets

  vpc_id                  = local.k8s_vpc_id
  map_public_ip_on_launch = true

  availability_zone = each.key
  tags = merge(local.tags, { Name = each.value["subnet_tag_name"] })
  
}



resource "aws_subnet" "k8s_private_subnet" {

  for_each = var.k8s_aws_private_subnets

  vpc_id                  = local.k8s_vpc_id
  map_public_ip_on_launch = true

  availability_zone = each.key
  tags = merge(local.tags, { Name = each.value["subnet_tag_name"] })
  
}


# resource "aws_subnet" "k8s_public_subnet" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.96.0/19"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     "Name"                       = "public-us-east-1b"
#     "kubernetes.io/role/elb"     = "1"
#     "kubernetes.io/cluster/demo" = "owned"
#   }
# }


# resource "aws_subnet" "public-us-east-1b" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.96.0/19"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     "Name"                       = "public-us-east-1b"
#     "kubernetes.io/role/elb"     = "1"
#     "kubernetes.io/cluster/demo" = "owned"
#   }
# }
