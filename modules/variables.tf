variable "block"  { default = "10.0.0.0/20" }
variable "block1" { default = "10.0.0.0/24" }
variable "block2" { default = "10.0.1.0/24" }
variable "block3" { default = "10.0.2.0/24" }
variable "block4" { default = "10.0.3.0/24" }

variable "ami_id" { default = "ami-09e6f87a47903347c" }
variable "instance_type" { default = "t2.micro"}
variable "key" { default = "audi-key"}