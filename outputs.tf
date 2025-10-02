output "elb_dns" {
  description = "Public DNS name of the Classic ELB"
  value       = aws_elb.classic.dns_name
}

output "vpc_id" {
  description = "Created VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}
