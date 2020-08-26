resource "aws_instance" "web" {
    ami                     = var.ami_instance
    instance_type           = var.instances_types
    security_groups         = [aws_security_group.web_traffic.name]
    user_data               = file("server-scritp.sh")
    #vpc_security_group_ids  = [aws_security_group.web_traffic.name]
    tags = {
        Name        = var.ec2name
    }
}

resource "aws_instance" "db" {
    ami                     = var.ami_instance
    instance_type           = var.instances_types
    tags = {
        Name        = var.dbname
    }

}