output "eks_private_subnets" {
  description = "aws private subnet collections"
  value = values(aws_subnet.k8s_private_subnet).*.id
}

output "eks_public_subnets" {
  description = "aws public subnet publiccollections"
  value = values(aws_subnet.k8s_public_subnet).*.id
}