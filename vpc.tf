resource "aws_vpc" "k8s_new_vpc" {
  count = var.k8s_use_vpc_id == null ? 1 : 0 

  cidr_block = var.k8s_vpc_cidr_block

  tags = {
    Name = "main"
  }
}
