# VPC TGW BASE

## Example:

```
Running with static_routes routes
module "tgw_vpc_route" {
  source = "git::git@github.com:cxagroup/infra-terraform-modules.git//transit-gateway-routes"
  name                           = "cxagroup"
  region                         = "ap-southeast-1"
  transit_gateway_id             = "tgw-0f7977fxxxxxxxx"
  transit_gateway_route_table_id = "rtb-yyyyyyyyya90f9f"
  primary_assume_role_arn        = var.primary_assume_role_arn
  shared_assume_role_arn         = var.shared_assume_role_arn
  vpc_id                         = vpc-0d390f54cxxxxxx
  dns_support                    = var.dns_support
  ipv6_support                   = var.ipv6_support
  static_routes = [
    {
      route_table_id         = "rtb-068b148xxxxxxxxxxxx"
      destination_cidr_block = "100.10.0.0/16"
    },
    {
      route_table_id         = "rtb-068b148yyyyyyyyyyyy"
      destination_cidr_block = "100.100.0.0/16"
    },
    {
      route_table_id         = "rtb-068b148zzzzzzzzzzzz"
      destination_cidr_block = "100.111.0.0/16"
    },
  ]
}

```


```
Running TGW Base with default routes in the same accounts
module "tgw_vpc_eks_sandbox_route" {
  source = "git::git@github.com:cxagroup/infra-terraform-modules.git//transit-gateway-routes"
  vpc_id = vpc-0d390f54cyyyyyy
  name = "eks_sandbox_poc"
}
```


```
Running TGW Base with default routes in the different accounts
module "tgw_vpc_eks_sandbox_route" {
  source = "git::git@github.com:cxagroup/infra-terraform-modules.git//transit-gateway-routes"
  primary_assume_role_arn = "arn:aws:iam::285584781843:role/AtlantisAssumedRole"
  vpc_id = vpc-0d390f54cyyyyyy
  name = "eks_sandbox_poc"
}
```
