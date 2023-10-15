variable "cluster_name" {
  type = string
}

variable "k8s_subnet_ids" {
  type = list(string)
}

variable "tgw_id" {
  type = string
}

variable "k8s_vpc_id" {
  type = string
}

variable "k8s_common_tags" {
  type = map(string)
}

variable "base_naming_standard" {
  type = string
}

variable "resource_name_standard" {
  type = string
  default = "PWB-TgwAtt"
}

variable "environment" {
  type = string
}