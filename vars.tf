variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "region_name" {
  default = "us-east-1"

}

variable "vpc_name" {
  type    = string
  default = "CITY_VPC"
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
