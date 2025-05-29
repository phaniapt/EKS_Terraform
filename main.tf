provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "VPC-networking" {
  source           = "./modules/VPC-networking"
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags             = var.tags
}

module "Subnets" {
  source                     = "./modules/Subnets"
  vpc_id                     = module.VPC-networking.vpc_id
  cidr_block_public_subnet1  = var.cidr_block_public_subnet1
  public_subnet1_tags        = var.public_subnet1_tags
  cidr_block_public_subnet2  = var.cidr_block_public_subnet2
  public_subnet2_tags        = var.public_subnet2_tags
  cidr_block_private_subnet1 = var.cidr_block_private_subnet1
  private_subnet1_tags       = var.private_subnet1_tags
  cidr_block_private_subnet2 = var.cidr_block_private_subnet2
  private_subnet2_tags       = var.private_subnet2_tags
}

module "Internet-gateway" {
  source     = "./modules/Internet-gateway"
  igw_vpc_id = module.VPC-networking.vpc_id
  igw_tags   = var.igw_tags
}

module "Route-table-pub" {
  source            = "./modules/Route-tables/Route-table-pub"
  pub_rt_vpc_id     = module.VPC-networking.vpc_id
  pub_rt_cidr_block = var.pub_rt_cidr_block
  pub_rt_igw        = var.pub_rt_igw
  pub_rt_tags       = var.pub_rt_tags
  pub1_subnet       = module.Subnets.subnet_1_id
  rt_pub1_subnet    = var.rt_pub1_subnet
  pub2_subnet       = module.Subnets.subnet_2_id
  rt_pub2_subnet    = var.rt_pub2_subnet
}

module "NAT-gateway" {
  source            = "./modules/NAT-gateway"
  allocation_id     = var.allocation_id
  connectivity_type = var.connectivity_type
  pub1_subnet_id    = module.Subnets.subnet_1_id
  nat_gt_tags       = var.nat_gt_tags
}

module "Route-table-private1" {
  source             = "./modules/Route-tables/Route-table-private1"
  prv1_rt_cidr_block = var.prv1_rt_cidr_block
  prv1_rt_vpc_id     = module.VPC-networking.vpc_id
  prv1_rt_nat_gw     = var.prv1_rt_nat_gw
  prv1_rt_tags       = var.prv1_rt_tags
  priv1_subnet       = module.Subnets.subnet_3_id
  rt_priv1_subnet    = var.rt_priv1_subnet
}

module "Route-table-private2" {
  source             = "./modules/Route-tables/Route-table-private2"
  prv2_rt_cidr_block = var.prv2_rt_cidr_block
  prv2_rt_vpc_id     = module.VPC-networking.vpc_id
  prv2_rt_nat_gw     = var.prv2_rt_nat_gw
  prv2_rt_tags       = var.prv2_rt_tags
  priv2_subnet       = module.Subnets.subnet_4_id
  rt_priv2_subnet    = var.rt_priv2_subnet
}

module "Security-groups" {
  source        = "./modules/Security-groups"
  description   = var.description
  egress_rules  = var.egress_rules
  ingress_rules = var.ingress_rules
  sg_name       = var.sg_name
  cal_sg_vpc_id = module.VPC-networking.vpc_id
}

module "EC2" {
  source             = "./modules/EC2"
  subnet_id          = module.Subnets.subnet_1_id
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_ids = module.Security-groups.security_group_ids
  ec2_tags           = var.ec2_tags
}

module "eks_cluster" {
  source       = "./modules/Eks-cluster"
  cluster_name = var.cluster_name
  cluster_tags = var.cluster_tags
  role_arn     = var.role_arn
}

module "eks_cluster_fargate_profile" {
  source               = "./modules/Fargate-profile"
  fargate_cluster_name = var.fargate_cluster_name
  fargate_profile_name = var.fargate_profile_name
  fargate_role_arn     = var.fargate_role_arn
}
