variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "region_name" {}

variable "vpc_name" {
  type    = string
  default = "CITY_VPC"
}

variable "subnet_names" {
  type    = list(string)
  default = ["CITY_SUBNET_1", "CITY_SUBNET_2"]
}


variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/25", "10.0.0.128/25"]
}
