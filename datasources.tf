data "aws_vpc" "default_vpc" {

    filter {
      name = "tag:Name"
      values = ["Default"]
    }
}