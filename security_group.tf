# SG here (vpc-default-sg)
resource "aws_security_group" "default" {
  name        = "Pehapkari default"
  description = "Pehapkari default desc"
  vpc_id      = "${aws_vpc.vpc.id}"
}
