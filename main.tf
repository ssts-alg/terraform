resource "aws_vpc" "abc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.abc.id
  cidr_block = var.public_subnet_cidrs[count.index]

  tags = {
    Name = "PublicSubnet-${count.index + 1}"
  }
}




resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.abc.id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"


  }
}
