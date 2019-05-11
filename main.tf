provider "aws" {
  region     = "eu-west-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name      = "pehapkari-vpc"
    Terraform = "1"
  }
}
