output "aws_vpc" {
  value = module.metaaphordriveway_vpc.*
}

output "vpc_id" {
  value = module.metaaphordriveway_vpc.vpc_id
}

output "public_subnets" {
  value = module.metaaphordriveway_vpc.public_subnets
}
