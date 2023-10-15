resource "aws_vpc" "k8s_new_vpc" {

  cidr_block = var.k8s_vpc_cidr_block

  tags = merge(
    local.k8s_common_tags, {
      "Name" = "${var.base_naming_standard}-VPC-${var.environment}"    
    }
  )
}
