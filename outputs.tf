output "PrivateIP" {
    value = aws_instance.db.private_ip
}
output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}