
# variable "vpc_cidr" {}
# variable "vpc_name" {}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "region_name" {
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "CITY_VPC_3"
}

variable "igw_name" {
  type    = string
  default = "CITY_IGW"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/25", "10.0.0.128/25"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/25", "10.0.1.128/25"]
}

variable "nat_gateway_name" {
  type    = string
  default = "CITY_NAT_GATEWAY"
}

variable "ami_id" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0d5eff06f840b45e9"
    "us-west-2" = "ami-0cf6f5c8a62fa5da6"
  }
}


variable "public_instance_count" {
  default = "1"
}
variable "private_instance_count" {
  default = "1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "devopsdemo"
}

variable "public_instance_name" {
  default = "city_public_instance"
}
variable "private_instance_name" {
  default = "city_private_instance"
}
