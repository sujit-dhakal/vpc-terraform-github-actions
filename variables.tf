variable "vpc_cidr" {
  description = "The ip range for vpc cidr"
  type = string
}

variable "subnet_cidr" {
    description = "Subnet cidrs"
    type = list(string)
}