resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.abc.id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

resource "aws_eip" "nat_eip" {}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.*.id[0]

  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.abc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Private_RT"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.private_rt.id
}
