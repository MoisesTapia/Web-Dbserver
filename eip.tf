resource "aws_eip" "web_ip" {
    instance    = aws_instance.web.id

}