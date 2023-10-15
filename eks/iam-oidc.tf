# Permissions for applications
# 
# option 1:Attach policy directly = every pod will get the same access to AWS resources
# option 2: (Open ID Connect) granting IAM permission based on the service account 
#
#
# OPTION 2
# IAM Role for service accounts
data "tls_certificate" "eks" {
  url = aws_eks_cluster.k8s_website.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.k8s_website.identity[0].oidc[0].issuer

  tags = var.k8s_common_tags

}
