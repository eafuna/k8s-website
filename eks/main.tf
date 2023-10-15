

resource "aws_iam_role_policy_attachment" "k8s_website-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.k8s_website.name
}

resource "aws_eks_cluster" "k8s_website" {
  name = var.cluster_name
  role_arn = aws_iam_role.k8s_website.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    
    subnet_ids = var.k8s_subnet_ids
  }

  tags = var.k8s_common_tags
    
  depends_on = [aws_iam_role_policy_attachment.k8s_website-AmazonEKSClusterPolicy]
}
