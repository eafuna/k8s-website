resource "random_id" "unique" {
  keepers = {
    first = "${timestamp()}"
  }     
  byte_length = 8
}

resource "aws_s3_bucket" "k8s_bucket" {
    count = length(var.k8s_buckets)

    bucket = "${var.cluster_name}-bucket-${var.k8s_buckets[count.index]}"

    tags = merge(
        local.k8s_common_tags,
        { Name = "${var.cluster_name}-bucket-${var.k8s_buckets[count.index]}"} )
}