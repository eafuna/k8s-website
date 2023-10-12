
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