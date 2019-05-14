# IGW here (internet_gateway)
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name      = "pehapkari-igw"
    Terraform = "1"
  }
}
