variable "region" {
  default = "ap-south-1"
}

variable "access_key" {
  default = "AKIAQBY54QAFXRTBXZSC"
}

variable "secret_key" {
  default = "QBuuGcOZQ7NQHOn+VL+YvRBFmepguSj9fI2EIFFK"
}

# VPC-networking

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "tags" {
  default = {
    Name = "project-vpc"
  }
}

# Subnets

variable "vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "cidr_block_public_subnet1" {
  default = "10.0.0.0/20"
}

variable "public_subnet1_tags" {
  default = {
    "Name"                   = "project-subnet-public1-ap-south-1a"
    "kubernetes.io/role/elb" = "1"
  }
}

variable "cidr_block_public_subnet2" {
  default = "10.0.16.0/20"
}

variable "public_subnet2_tags" {
  default = {
    "Name"                   = "project-subnet-public2-ap-south-1b"
    "kubernetes.io/role/elb" = "1"
  }
}

variable "cidr_block_private_subnet1" {
  default = "10.0.128.0/20"
}

variable "private_subnet1_tags" {
  default = {
    "Name"                            = "project-subnet-private1-ap-south-1a"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

variable "cidr_block_private_subnet2" {
  default = "10.0.144.0/20"
}

variable "private_subnet2_tags" {
  default = {
    "Name"                            = "project-subnet-private2-ap-south-1b"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

# Internet-gateway

variable "igw_vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "igw_tags" {
  default = {
    "Name" = "project-igw"
  }
}

# route-table-public

variable "pub_rt_vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "pub_rt_cidr_block" {
  default = "0.0.0.0/0"
}

variable "pub_rt_igw" {
  default = "igw-0a2de4b1cf96394ef"
}

variable "pub_rt_tags" {
  default = {
    Name = "project-rtb-public"
  }
}

variable "pub1_subnet" {
  default = "subnet-01df5c8fae8d1aa7c"
}

variable "rt_pub1_subnet" {
  default = "rtb-0856b4f3245aba15f"
}

variable "pub2_subnet" {
  default = "subnet-05426976e1bb7292b"
}

variable "rt_pub2_subnet" {
  default = "rtb-0856b4f3245aba15f"
}

# NAT-gateway

variable "allocation_id" {
  default = "eipalloc-09d89adc2861ba0a1"
}

variable "connectivity_type" {
  default = "public"
}

variable "pub1_subnet_id" {
  default = "subnet-01df5c8fae8d1aa7c"
}

variable "nat_gt_tags" {
  default = {
    "Name" = "project-nat-public1-ap-south-1a"
  }
}

# Route-table-private1

variable "prv1_rt_vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "prv1_rt_cidr_block" {
  default = "0.0.0.0/0"
}

variable "prv1_rt_nat_gw" {
  default = "nat-071662a28ce3d26d0"
}

variable "prv1_rt_tags" {
  default = {
    "Name" = "project-rtb-private1-ap-south-1a"
  }
}

variable "priv1_subnet" {
  default = "subnet-06f05e84b79efe7af"
}

variable "rt_priv1_subnet" {
  default = "rtb-081c281f28aec0145"
}

# Route-table-private2

variable "prv2_rt_vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "prv2_rt_cidr_block" {
  default = "0.0.0.0/0"
}

variable "prv2_rt_nat_gw" {
  default = "nat-071662a28ce3d26d0"
}

variable "prv2_rt_tags" {
  default = {
    "Name" = "project-rtb-private2-ap-south-1b"
  }
}

variable "priv2_subnet" {
  default = "subnet-0aff63f6ce8454f98"
}

variable "rt_priv2_subnet" {
  default = "rtb-0408ecebcf1039429"
}

# # Security-groups

variable "description" {
  default = "launch-wizard-1 created 2023-04-27T01:53:37.019Z"
}

variable "sg_name" {
  default = "launch-wizard-1"
}

variable "cal_sg_vpc_id" {
  default = "vpc-0ba125a3f4721f2d4"
}

variable "egress_rules" {
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "all"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
}

variable "ingress_rules" {
  default = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "all"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
}

# EC2

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-03a933af70fa97ad2"
}

variable "subnet_id" {
  default = "subnet-01df5c8fae8d1aa7c"
}

variable "security_group_ids" {
  default = "sg-0270d9c436b56e917"
}

variable "ec2_tags" {
  default = {
    "Name" = "eks-prac"
  }
}

# EKS-Cluster

variable "cluster_name" {
  default = "eks-cluster-practice"
}

variable "role_arn" {
  default = "arn:aws:iam::003820781579:role/eksClusterRole"
}

variable "cluster_tags" {
  default = {
    "alpha.eksctl.io/cluster-oidc-enabled" = "true"
  }
}

# Fargate-profile

variable "fargate_cluster_name" {
  default = "eks-cluster-practice"
}

variable "fargate_profile_name" {
  default = "fargate-eks-cluster-practice"
}
variable "fargate_role_arn" {
  default = "arn:aws:iam::003820781579:role/AmazonEKSFargatePodExecutionRole"
}
