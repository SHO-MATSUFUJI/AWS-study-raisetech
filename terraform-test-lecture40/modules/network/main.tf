resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

 tags = {
    Name = "SimpleVPC"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone="ap-northeast-1a"
  map_public_ip_on_launch=true
  tags = {
    Name = "PublicSubnet_1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone="ap-northeast-1c"
  map_public_ip_on_launch=true
  tags = {
    Name = "PublicSubnet_1c"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone="ap-northeast-1a"
  map_public_ip_on_launch=false
  tags = {
    Name = "PrivateSubnet_1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone="ap-northeast-1c"
  map_public_ip_on_launch=false
  tags = {
    Name = "PrivateSubnet_1c"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MyInternetGateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_1c.id
  route_table_id = aws_route_table.private.id
}