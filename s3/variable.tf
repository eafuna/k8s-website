variable "cluster_name" {
    type = string
}

variable "k8s_common_tags" {
  type = map(string)
}

variable "environment" {
  type = string
}

variable "base_naming_standard" {
  type = string
}