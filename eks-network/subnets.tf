

resource "aws_subnet" "k8s_public_subnet" {

  for_each = var.k8s_aws_public_subnets

  vpc_id                  = local.k8s_vpc_id
  cidr_block              = var.k8s_aws_public_subnets[each.key].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.k8s_aws_public_subnets[each.key].az

  tags = merge(
    local.k8s_common_tags,
    local.k8s_required_subnet_tags, 
    { Name = each.value["subnet_tag_name"] }) 
}


resource "aws_subnet" "k8s_private_subnet" {

  for_each = var.k8s_aws_private_subnets

  vpc_id                  = local.k8s_vpc_id
  cidr_block              = var.k8s_aws_private_subnets[each.key].cidr
  map_public_ip_on_launch = false  
  availability_zone       = var.k8s_aws_private_subnets[each.key].az

  tags = merge(
    local.k8s_common_tags,
    local.k8s_required_subnet_tags, 
    { Name = each.value["subnet_tag_name"] })
  
}

resource "aws_subnet" "k8s_db_subnet" {

  for_each = var.k8s_aws_db_subnets

  vpc_id                  = local.k8s_vpc_id
  cidr_block              = var.k8s_aws_db_subnets[each.key].cidr
  map_public_ip_on_launch = false  
  availability_zone       = var.k8s_aws_db_subnets[each.key].az

  tags = merge(
    local.k8s_common_tags,
    local.k8s_required_subnet_tags, 
    { Name = each.value["subnet_tag_name"] })
  
}
