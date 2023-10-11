output "name" {
#   value = aws_subnet.k8s_public_subnet[*]
#   value = [for k in aws_subnet.k8s_public_subnet : x.id ]
# aws_subnet.k8s_public_subnet
    value = concat(values(aws_subnet.k8s_public_subnet).*.id,values(aws_subnet.k8s_public_subnet).*.id)
    #+[values(aws_subnet.k8s_public_subnet).*.id]
}

output "x" {
    value = aws_subnet.k8s_public_subnet[0]
  
}