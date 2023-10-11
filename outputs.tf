output "name" {
    value = concat(values(aws_subnet.k8s_public_subnet).*.id,values(aws_subnet.k8s_public_subnet).*.id)
}

