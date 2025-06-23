variable "vpc_cidr" {}
variable "public_subnets" { type = list(string) }
variable "availability_zones" { type = list(string) }
variable "environment" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
