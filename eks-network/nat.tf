# allow services to allow internet 
resource "aws_eip" "nat" {
  for_each = aws_route_table_association.k8s_public_routes
  vpc = true

  tags = merge(
    local.k8s_common_tags, {
      Name = "${var.base_naming_standard}-NatEip-${var.environment}"    
    })

  depends_on = [aws_internet_gateway.igw]    
}

resource "aws_nat_gateway" "nat" {
  for_each = local.k8s_has_public_subnet ? aws_subnet.k8s_public_subnet : {}

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.k8s_public_subnet[each.key].id 
  
  tags = merge(
    local.k8s_common_tags, {
      Name = "${var.base_naming_standard}-NatGw-${var.environment}"    
    })

  depends_on = [aws_internet_gateway.igw]
}
