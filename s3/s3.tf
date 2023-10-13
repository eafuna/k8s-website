
data "aws_region" "current" {}

resource "aws_s3_bucket" "k8s_bucket" {

    bucket = "k8s-bucket-${data.aws_region.current.name}"

    tags = merge(
        var.k8s_common_tags,
        { Name = "k8s-bucket-${data.aws_region.current.name}"} )
}