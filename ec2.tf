data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_a.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "server"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "Allow Database"
  description = "Allow Database inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.amc-vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_sg_ig1" {
  security_group_id = aws_security_group.ec2_sg.id 
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol              = "tcp"
  from_port         = 0
  to_port           = 65535
}

resource "aws_vpc_security_group_egress_rule" "ec2_sg_eg1" {
  security_group_id = aws_security_group.ec2_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 65535
}