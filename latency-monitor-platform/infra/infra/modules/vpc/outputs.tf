output "id" {
  value = module.vpc.vpc_id
}

output "arn" {
  value = module.vpc.vpc_arn
}

output "private_subnets" {
  value = module.vpc.private_subnets
}