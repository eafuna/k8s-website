############################################################################
#
# TESTING ONLY, WE HAVE TO USE DEDICATED HOST INSTEAD OF THIS
# Single instance
#
#############################################################################


resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.k8s_website.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = values(aws_subnet.k8s_private_subnet).*.id

  # using AWS default k8 version
  # version = XXX

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "${var.cluster_name}-node-group-private"
  }

  # taint {
  #   key    = "team"
  #   value  = "devops"
  #   effect = "NO_SCHEDULE"
  # }

  # launch_template {
  #   name    = aws_launch_template.eks-with-disks.name
  #   version = aws_launch_template.eks-with-disks.latest_version
  # }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}


# resource "aws_eks_node_group" "public-nodes" {
#   cluster_name    = aws_eks_cluster.k8s_website.name
#   node_group_name = "public-nodes"
#   node_role_arn   = aws_iam_role.nodes.arn

#   subnet_ids = values(aws_subnet.k8s_aws_public_subnets).*.id

#   capacity_type  = "ON_DEMAND"
#   instance_types = ["t3.small"]

#   scaling_config {
#     desired_size = 1
#     max_size     = 5
#     min_size     = 0
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   labels = {
#     role = "${var.cluster_name}-public-general"
#   }

#   # taint {
#   #   key    = "team"
#   #   value  = "devops"
#   #   effect = "NO_SCHEDULE"
#   # }

#   # launch_template {
#   #   name    = aws_launch_template.eks-with-disks.name
#   #   version = aws_launch_template.eks-with-disks.latest_version
#   # }

#   depends_on = [
#     aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
#   ]
# }
# # resource "aws_launch_template" "eks-with-disks" {
# #   name = "eks-with-disks"

# #   key_name = "local-provisioner"

# #   block_device_mappings {
# #     device_name = "/dev/xvdb"

# #     ebs {
# #       volume_size = 50
# #       volume_type = "gp2"
# #     }
# #   }
# # }
