resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.abc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public_RT"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.abc.id
  tags = {
    Name = "Private_RT"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.abc.id

  tags = {
    Name = var.igw_name
  }
}
