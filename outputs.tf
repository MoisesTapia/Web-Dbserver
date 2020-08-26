output "Private_ip" {
    value = aws_instance.db.private_ip
}
output "Public_ip" {
    value = aws_eip.web_ip.public_ip
}

output "aws_Web" {
    value = aws_instance.web.id
}

output "aws_DB" {
    value = aws_instance.db.id
}

output "ec2_web_ami" {
    value = aws_instance.web.ami
}

output "ec2_db_ami" {
    value = aws_instance.db.ami
}

output "security_group_id" {
    value = aws_security_group.web_traffic.id
}

output "av_zone_web" {
    value = aws_instance.web.availability_zone
}

output "av_zone_db" {
    value = aws_instance.db.availability_zone
}

#output "vpc_name_id" {
#    value = aws_vpc.web.id
#}
