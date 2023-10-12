locals {
  k8s_vpc_id = var.k8s_use_vpc_id

  k8s_required_subnet_tags = {
  #   "Name" = "Something" Display in aws console
    "kubernetes.io/role/internal-elb"             = "1" # - required for kubernetes to discover subnets where private load balancers will be created 
    "kubernetes.io/cluster/{$var.cluster_name}"   = "owned" # subnet owned exclussively by cluster
  }
}
