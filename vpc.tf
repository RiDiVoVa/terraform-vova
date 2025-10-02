data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = "${var.project_name}-vpc"
  cidr = "10.0.0.0/16"

  azs                     = local.azs
  public_subnets          = var.public_subnet_cidrs
  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_nat_gateway   = false

  tags = merge(var.tags, {
    Name = "${var.project_name}-vpc"
  })
}
