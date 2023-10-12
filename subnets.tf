


resource "aws_subnet" "k8s_public_subnet" {

  for_each = var.k8s_aws_public_subnets

  vpc_id                  = local.k8s_vpc_id
  map_public_ip_on_launch = true

  availability_zone = each.key
  tags = merge(local.k8s_required_subnet_tags, { Name = each.value["subnet_tag_name"] })
  
}



resource "aws_subnet" "k8s_private_subnet" {

  for_each = var.k8s_aws_private_subnets

  vpc_id                  = local.k8s_vpc_id
  map_public_ip_on_launch = true

  availability_zone = each.key
  tags = merge(local.k8s_required_subnet_tags, { Name = each.value["subnet_tag_name"] })
  
}

