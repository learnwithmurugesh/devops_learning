vpc_cidr           = "10.0.0.0/20"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets =   [ "10.0.3.0/24", "10.0.4.0/24" ]
availability_zones = ["us-east-1a", "us-east-1b"]
environment        = "dev"
ami_id             = "ami-09e6f87a47903347c"
instance_type      = "t2.micro"
key_name           = "audi-key"
