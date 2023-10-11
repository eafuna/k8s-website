resource "aws_internet_gateway" "igw" {
  vpc_id = local.k8s_vpc_id

  tags = {
    Name = "igw"
  }
}
