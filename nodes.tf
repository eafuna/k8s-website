############################################################################
#
# TESTING ONLY, WE HAVE TO USE DEDICATED HOST INSTEAD OF THIS
# Single instance
#
#############################################################################

resource "aws_iam_role" "nodes" {
  name = "${var.cluster_name}-group-nodes"
  
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}

resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.k8s_website.name
  node_group_name = "private-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = values(aws_subnet.k8s_private_subnet).*.id

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "${var.cluster_name}-private-general"
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
