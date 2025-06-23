provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source             = "git::https://github.com/learnwithmurugesh/devops_learning.git//modules/vpc?ref=main"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "security_group" {
  source      = "git::https://github.com/learnwithmurugesh/devops_learning.git//modules/security_group?ref=main"
  name        = "ec2-sg"
  description = "Allow SSH"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
  source             = "git::https://github.com/learnwithmurugesh/devops_learning.git//modules/ec2?ref=main"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_group.security_group_id]
  key_name           = var.key_name
  instance_name      = "${var.environment}-ec2"
}
