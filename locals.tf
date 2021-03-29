locals {
  temp_routes  = {
    for k, v in var.static_routes : k => merge(
      v,
    )
  }
  default_routes = [
    {
        route_table_id         = data.aws_route_table.private.id
        destination_cidr_block = var.dst_private_subnet
    },
    {
        route_table_id         = data.aws_route_table.public.id
        destination_cidr_block = var.dst_vpn_subnet
    }
  ]
  static_routes = [for k, v in local.temp_routes : v]
}
