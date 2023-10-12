
module "eks_network" {
  source = "./eks-network"
  
  cluster_name = var.cluster_name
}


# module "eks" {
#   source = "./eks"
  
#   k8s_subnet_ids =  concat(
#       values(module.eks_network.k8s_public_subnet).*.id,
#       values(module.eks_network.k8s_private_subnet).*.id
#     ) 

#   cluster_name = var.cluster_name
# }