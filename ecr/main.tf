resource "aws_ecr_repository" "k8s_ecr" {
  name                 = "ytlcpwd"
  image_tag_mutability = "IMMUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.k8s_common_tags

}