resource "aws_security_group" "web_traffic" {
    name    = "Allow Web Traffic via HTTPS"

    dynamic "ingress" {
        iterator        = port
        for_each        = var.ingressrule
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.egressrule
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}