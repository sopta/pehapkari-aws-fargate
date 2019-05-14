# Subnet here (subnet)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${length(var.cidr_block)}"
  cidr_block              = "${element(var.cidr_block, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  tags {
    Name      = "pehapkari-${element(var.availability_zones, count.index)}-public-subnet"
    Terraform = "1"
  }
}
