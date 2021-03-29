data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "*-private-*"
  }
}

data "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "*-private"
  }
}

data "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "*-public"
  }
}
