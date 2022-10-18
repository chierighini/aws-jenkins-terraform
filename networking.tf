resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "main_public_route_table" {
  vpc_id = aws_vpc.example_vpc.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.main_gateway.id
  }
}
