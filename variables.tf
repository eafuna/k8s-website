variable "cluster_name" {
  default = "PWB_STG"
  type = string
  description = "EKS Staging Cluster"
  nullable = false
}

variable "tgw_id" {
  type = string
  default = "tgw-0925e10c2390ab1ee"
}

variable "base_naming_standard" {
  type = string
  default = "YTLC-MY-AWS"
}

variable "environment" {
  type = string
  default = "PWB-STG-NonProd"
}