resource "aws_route_table" "rt_private_a" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {})
}

resource "aws_route_table_association" "rt_assoc_private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.rt_private_a.id
}

resource "aws_route" "route_pa" {
  route_table_id         = aws_route_table.rt_private_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw-2a-public.id
}

resource "aws_route_table" "rt_private_b" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {})
}

resource "aws_route_table_association" "rt_assoc_private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.rt_private_b.id
}

resource "aws_route" "route_pb" {
  route_table_id         = aws_route_table.rt_private_b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw-2b-public.id
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.amc-vpc.id
  tags                    = merge(var.tags, {})
  map_public_ip_on_launch = false
  cidr_block              = var.private_subnets.a
  availability_zone       = "us-east-2a"
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.amc-vpc.id
  tags                    = merge(var.tags, {})
  map_public_ip_on_launch = false
  cidr_block              = var.private_subnets.b
  availability_zone       = "us-east-2b"
}
