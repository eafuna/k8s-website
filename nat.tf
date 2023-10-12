# allow services to allow internet 
resource "aws_eip" "nat" {
  vpc = true

  tags = merge(
    local.k8s_common_tags,
    { Name = "${var.cluster_name}-nat-eip"} )
}

resource "aws_nat_gateway" "nat" {
  for_each = aws_subnet.k8s_public_subnet

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.k8s_public_subnet[each.key].id 
  
  tags = merge(
    local.k8s_common_tags,
    { Name = "${var.cluster_name}-nat-gateway"} )

  depends_on = [aws_internet_gateway.igw]
}
