locals {
  common_tags = {
    Environment = var.environment
    GitHub      = "pc-vpc-wrapper"
    Owner       = "pc"
  }
  common_name = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"

  vpc_name                      = var.name == "" ? "${local.common_name}-vpc" : var.name
  database_subnet_group_name    = var.database_subnet_group_name == "" ? "${local.common_name}-database-subnet-group" : var.database_subnet_group_name
  elasticache_subnet_group_name = var.elasticache_subnet_group_name == "" ? "${local.common_name}-elasticache-subnet-group" : var.elasticache_subnet_group_name
  redshift_subnet_group_name    = var.redshift_subnet_group_name == "" ? "${local.common_name}-redshift-subnet-group" : var.redshift_subnet_group_name
  default_network_acl_name      = var.default_network_acl_name == "" ? "${local.common_name}-default-network-acl" : var.default_network_acl_name
  default_route_table_name      = var.default_route_table_name == "" ? "${local.common_name}-default-route-table" : var.default_route_table_name
  default_security_group_name   = var.default_security_group_name == "" ? "${local.common_name}-default-security-group" : var.default_security_group_name
  default_vpc_name              = var.default_vpc_name == "" ? "${local.common_name}-default-vpc" : var.default_vpc_name
  public_subnet_names           = length(var.public_subnet_names) > 0 ? var.public_subnet_names : [for idx in range(length(var.public_subnets)) : "${local.common_name}-public-${idx + 1}"]
  private_subnet_names          = length(var.private_subnet_names) > 0 ? var.private_subnet_names : [for idx in range(length(var.private_subnets)) : "${local.common_name}-private-${idx + 1}"]
  database_subnet_names         = length(var.database_subnet_names) > 0 ? var.database_subnet_names : [for idx in range(length(var.database_subnets)) : "${local.common_name}-database-${idx + 1}"]
  redshift_subnet_names         = length(var.redshift_subnet_names) > 0 ? var.redshift_subnet_names : [for idx in range(length(var.redshift_subnets)) : "${local.common_name}-redshift-${idx + 1}"]
  elasticache_subnet_names      = length(var.elasticache_subnet_names) > 0 ? var.elasticache_subnet_names : [for idx in range(length(var.elasticache_subnets)) : "${local.common_name}-elasticache-${idx + 1}"]
  intra_subnet_names            = length(var.intra_subnet_names) > 0 ? var.intra_subnet_names : [for idx in range(length(var.intra_subnets)) : "${local.common_name}-intra-${idx + 1}"]
  outpost_subnet_names          = length(var.outpost_subnet_names) > 0 ? var.outpost_subnet_names : [for idx in range(length(var.outpost_subnets)) : "${local.common_name}-outpost-${idx + 1}"]

  vpc_tags                      = merge(local.common_tags, var.vpc_tags, { Name = local.vpc_name })
  database_route_table_tags     = merge(local.common_tags, var.database_route_table_tags)
  default_network_acl_tags      = merge(local.common_tags, var.default_network_acl_tags, { Name = local.default_network_acl_name })
  default_route_table_tags      = merge(local.common_tags, var.default_route_table_tags, { Name = local.default_route_table_name })
  default_security_group_tags   = merge(local.common_tags, var.default_security_group_tags, { Name = local.default_security_group_name })
  default_vpc_tags              = merge(local.common_tags, var.default_vpc_tags, { Name = local.default_vpc_name })
  database_subnet_group_tags    = merge(local.common_tags, var.database_subnet_group_tags, { Name = local.database_subnet_group_name })
  elasticache_subnet_group_tags = merge(local.common_tags, var.elasticache_subnet_group_tags, { Name = local.elasticache_subnet_group_name })
  redshift_subnet_group_tags    = merge(local.common_tags, var.redshift_subnet_group_tags, { Name = local.redshift_subnet_group_name })

  customer_gateway_tags        = merge(local.common_tags, var.customer_gateway_tags)
  database_acl_tags            = merge(local.common_tags, var.database_acl_tags)
  dhcp_options_tags            = merge(local.common_tags, var.dhcp_options_tags)
  elasticache_acl_tags         = merge(local.common_tags, var.elasticache_acl_tags)
  elasticache_route_table_tags = merge(local.common_tags, var.elasticache_route_table_tags)
  igw_tags                     = merge(local.common_tags, var.igw_tags)
  intra_acl_tags               = merge(local.common_tags, var.intra_acl_tags)
  intra_route_table_tags       = merge(local.common_tags, var.intra_route_table_tags)
  nat_eip_tags                 = merge(local.common_tags, var.nat_eip_tags)
  nat_gateway_tags             = merge(local.common_tags, var.nat_gateway_tags)
  outpost_acl_tags             = merge(local.common_tags, var.outpost_acl_tags)
  private_acl_tags             = merge(local.common_tags, var.private_acl_tags)
  private_route_table_tags     = merge(local.common_tags, var.private_route_table_tags)
  public_acl_tags              = merge(local.common_tags, var.public_acl_tags)
  public_route_table_tags      = merge(local.common_tags, var.public_route_table_tags)
  redshift_acl_tags            = merge(local.common_tags, var.redshift_acl_tags)
  redshift_route_table_tags    = merge(local.common_tags, var.redshift_route_table_tags)
  vpc_flow_log_tags            = merge(local.common_tags, var.vpc_flow_log_tags)
  vpn_gateway_tags             = merge(local.common_tags, var.vpn_gateway_tags)
  public_subnet_tags           = merge(local.common_tags, var.public_subnet_tags)
  private_subnet_tags          = merge(local.common_tags, var.private_subnet_tags)
  database_subnet_tags         = merge(local.common_tags, var.database_subnet_tags)
  redshift_subnet_tags         = merge(local.common_tags, var.redshift_subnet_tags)
  elasticache_subnet_tags      = merge(local.common_tags, var.elasticache_subnet_tags)
  intra_subnet_tags            = merge(local.common_tags, var.intra_subnet_tags)
  outpost_subnet_tags          = merge(local.common_tags, var.outpost_subnet_tags)
}