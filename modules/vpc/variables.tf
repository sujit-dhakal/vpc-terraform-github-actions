variable "vpc_cidr" {
  description = "The ip range for vpc cidr"
  type = string
}

variable "subnet_cidr" {
    description = "Subnet cidrs"
    type = list(string)
}

variable "subnet_names" {
  description = "Subnet names"
  type = list(string)
  default = [ "PublicSubnet1", "PublicSubnet2" ]
}

variable "azs" {
  description = "Availability zones"
  type = list(string)
}