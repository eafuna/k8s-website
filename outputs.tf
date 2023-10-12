output "name" {
    value = concat(values(aws_subnet.k8s_public_subnet).*.id,values(aws_subnet.k8s_public_subnet).*.id)
}

output "x" {
    value = aws_route_table.private
}

output "xcc" {
    value = local.k8s_has_public_subnet
}
