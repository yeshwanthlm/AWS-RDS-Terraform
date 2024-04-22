resource "aws_internet_gateway" "amc-vpc-igw" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {})
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.amc-vpc.id
  tags              = merge(var.tags, {})
  cidr_block        = var.subnets.b
  availability_zone = "us-east-2b"
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.amc-vpc.id
  tags              = merge(var.tags, {})
  cidr_block        = var.subnets.a
  availability_zone = "us-east-2a"
}

resource "aws_eip" "eip_b" {
  tags = merge(var.tags, {})
}

resource "aws_eip" "eip_a" {
  tags = merge(var.tags, {})
}

resource "aws_nat_gateway" "nat-gw-2a-public" {
  allocation_id = aws_eip.eip_a.id
  subnet_id     = aws_subnet.public_a.id
  tags          = merge(var.tags, {})
  depends_on    = [aws_eip.eip_a]
}

resource "aws_nat_gateway" "nat-gw-2b-public" {
  allocation_id = aws_eip.eip_b.id
  subnet_id     = aws_subnet.public_b.id
  tags          = merge(var.tags, {})
  depends_on    = [aws_eip.eip_b]
}

resource "aws_route_table" "rt_public_a" {
  vpc_id = aws_vpc.amc-vpc.id
}

resource "aws_route_table_association" "rt_assoc_public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.rt_public_a.id
}

resource "aws_route" "route_a" {
  route_table_id         = aws_route_table.rt_public_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.amc-vpc-igw.id
}

resource "aws_route_table" "rt_public_b" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {})
}

resource "aws_route_table_association" "rt_assoc_public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.rt_public_b.id
}

resource "aws_route" "route_b" {
  route_table_id         = aws_route_table.rt_public_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.amc-vpc-igw.id
}


