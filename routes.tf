resource "aws_route_table" "private" {
  for_each = aws_nat_gateway.nat

  vpc_id = local.k8s_vpc_id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat[each.key].id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = merge(
    local.k8s_common_tags,
    { Name = "${var.cluster_name}-private-route-table"} )

}

resource "aws_route_table" "public" {
  vpc_id = local.k8s_vpc_id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = merge(
    local.k8s_common_tags,
    { Name = "${var.cluster_name}-public-route-table"} )

}

resource "aws_route_table_association" "k8s_private_routes" {
  for_each = aws_subnet.k8s_private_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}


resource "aws_route_table_association" "k8s_public_routes" {
  for_each = aws_subnet.k8s_public_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
