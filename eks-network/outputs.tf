output "eks_private_subnets" {
  description = "aws private subnet collections"
  value = values(aws_subnet.k8s_private_subnet).*.id
}

output "eks_public_subnets" {
  description = "aws public subnet publiccollections"
  value = values(aws_subnet.k8s_public_subnet).*.id
}

output "eks_db_subnets" {
  description = "aws public subnet publiccollections"
  value = values(aws_subnet.k8s_db_subnet).*.id
}

output "eks_vpc_id" {
  value = aws_vpc.k8s_new_vpc.id
}