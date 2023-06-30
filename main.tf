module "vpc" {
  source = "./vpc"
}

module "eks" {
    source = "./eks"
    subnets_id = module.vpc.subnets_id
    vpc_id = module.vpc.vpc_id
}

# module "eks_jenkins" {
#     source = "./eks_jenkins"
#     subnets_id = module.vpc.subnets_id
#     vpc_id = module.vpc.vpc_id
# }