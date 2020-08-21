region            = "us-west-1"
ami_instance      = "ami-066df92ac6f03efca"
instances_types   = "t2.micro"
ec2name           = "WebServer"
dbname            = "DBdata"
ingressrule       = [80,443]
egressrule        = [80,443]
protocol_net      = "tcp"