
module "eks_network" {
  source = "./eks-network"
  
  cluster_name = var.cluster_name
}


module "eks" {
  source = "./eks"
  
  k8s_subnet_ids =  concat(
    module.eks_network.eks_public_subnets,
    module.eks_network.eks_private_subnets,    
  )

  cluster_name = var.cluster_name
}


module "s3_bucket_regional" {
  source = "./s3"
  
  cluster_name = var.cluster_name

  k8s_common_tags = local.k8s_common_tags
}

module "k8s_tgw_attachment" {
  source = "./tgw"
  
  cluster_name = var.cluster_name

  k8s_common_tags = local.k8s_common_tags

  tgw_id = var.tgw_id
  k8s_subnet_ids = module.eks_network.eks_private_subnets
  k8s_vpc_id = module.eks_network.eks_vpc_id
}
