variable "region" {
    type        = string
    description = "Region"
}
variable "dbname" {
    type        = string
}
variable "ami_instance" {
    type        = string 
    description = "ami to the instance"
}
variable "instances_types" {
    type        = string
    description = "Type of instance"
}
variable "ec2name" {
    type        = string
    description = "Name of the instance"
}

variable "ingressrule" {
    description = "Intbound ports"
    type        = list(number)
}

variable "egressrule" {
    description = "Outbound ports"
    type        = list(number)
}

variable "protocol_net" {
    type        = string
}