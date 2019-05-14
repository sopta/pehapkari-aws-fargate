# SG here (vpc-default-sg)

resource "aws_security_group" "default" {
  name        = "Default"
  description = "Default VPC"
  vpc_id      = "${aws_vpc.vpc.id}"
}
