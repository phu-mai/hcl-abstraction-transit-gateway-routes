module "tgw_vpc_route" {
  source                         = "terraform-aws-modules/transit-gateway-routes/aws"
  name                           = "aws"
  region                         = var.region
  transit_gateway_id             = var.transit_gateway_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
  primary_assume_role_arn        = var.primary_assume_role_arn
  shared_assume_role_arn         = var.shared_assume_role_arn
  vpc_attachments = {
    (var.name) = {
      vpc_id       = var.vpc_id
      subnet_ids   = length(var.vpc_subnet_ids) ==  0 ? slice(tolist(data.aws_subnet_ids.private.ids), 0, 3) : var.vpc_subnet_ids
      dns_support  = var.dns_support
      ipv6_support = var.ipv6_support
      routes       = length(var.static_routes) == 0 ? local.default_routes : local.static_routes
    }
  }
}
