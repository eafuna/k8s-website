# tgw-0925e10c2390ab1ee

resource "aws_ec2_transit_gateway_vpc_attachment" "k8s_tgw_attachment" {
  subnet_ids         = var.k8s_subnet_ids
  transit_gateway_id = var.tgw_id
  vpc_id             = var.k8s_vpc_id
  
  tags = merge(
    var.k8s_common_tags,
    { Name = "${var.cluster_name}-k8s-tgw-attahments"} )
}