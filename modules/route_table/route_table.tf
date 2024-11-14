# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "PublicRouteTable_lab_1"
  }
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "PrivateRouteTable_lab_1"
  }
}

# Private Subnet Association
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

# Public Subnet Association
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_rt.id
}