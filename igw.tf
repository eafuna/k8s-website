resource "aws_internet_gateway" "igw" {
  vpc_id = local.k8s_vpc_id

  tags = merge(
    local.k8s_common_tags,
    { Name = "${var.cluster_name}-igw"} )
    
}
