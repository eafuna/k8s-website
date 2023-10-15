
data "aws_region" "current" {}

resource "aws_s3_bucket" "k8s_bucket" {

    bucket = "${lower(var.base_naming_standard)}-s3-${data.aws_region.current.name}-${lower(var.environment)}"

    tags = merge(
        var.k8s_common_tags, {
        Name = "${var.base_naming_standard}-s3-${var.environment}"    
    })
}