locals {
  k8s_vpc_id = aws_vpc.k8s_new_vpc.id

  k8s_required_subnet_tags = {
    # "Name" = "Something" Display in aws console
    "kubernetes.io/role/internal-elb"             = "1" # - required for kubernetes to discover subnets where private load balancers will be created 
    "kubernetes.io/cluster/{$var.cluster_name}"   = "owned" # subnet owned exclussively by cluster
  }

  k8s_common_tags = {
    "owner" = var.cluster_name
  }

  k8s_has_public_subnet = length(var.k8s_aws_public_subnets) > 0 ? true : false

}
