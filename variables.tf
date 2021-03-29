variable "create" {
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "vpc_id" {
  type = string
}

variable "vpc_subnet_ids" {
  type        = list(string)
  default     = []
}

variable "region" {
  type        = string
  default     = "ap-southeast-1"
}

variable "primary_assume_role_arn" {
  description = "Primary assume role arn of TGW"
  type        = string
  default     = ""

}

variable "shared_assume_role_arn" {
  description = "Shared assume role arn of TGW"
  type        = string
  default     = ""
}

variable "transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway."
  type        = string
  default     = ""
}

variable "transit_gateway_route_table_id" {
  type        = string
  default     = ""
}

variable "dst_private_subnet" {
  default = "100.0.0.0/8"
  type    = string
}

variable "dst_vpn_subnet" {
  default = "100.126.8.0/21"
  type    = string
}

variable "static_routes" {
  type    = list(any)
  default = []
}

variable "dns_support" {
  description = "enable dns support on vpc attachment"
  type        = bool
  default     = true
}

variable "ipv6_support" {
  description = "enable support IPv6 on vpc attachment"
  type        = bool
  default     = false
}
