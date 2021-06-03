resource "aws_vpc" "abc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "xyz" {
  vpc_id     = aws_vpc.abc.id
  cidr_block = var.subnet_cidrs[0]

  tags = {
    Name = var.subnet_names[0]
  }
}

resource "aws_subnet" "xyz1" {
  vpc_id     = aws_vpc.abc.id
  cidr_block = var.subnet_cidrs[1]

  tags = {
    Name = var.subnet_names[1]
  }
}
