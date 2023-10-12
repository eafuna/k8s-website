resource "aws_iam_role" "k8s_website" {
  name = "${var.cluster_name}-iam-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "k8s_website-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.k8s_website.name
}

resource "aws_eks_cluster" "k8s_website" {
  # WARNING! Bare minimum configuration
  name = "${var.cluster_name}-cluster"
  role_arn = aws_iam_role.k8s_website.arn

  vpc_config {
    subnet_ids = concat(
      values(aws_subnet.k8s_public_subnet).*.id,
      values(aws_subnet.k8s_private_subnet).*.id
    )

  }

  depends_on = [aws_iam_role_policy_attachment.k8s_website-AmazonEKSClusterPolicy]
}
