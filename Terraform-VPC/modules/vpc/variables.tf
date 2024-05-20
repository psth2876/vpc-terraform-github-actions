variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRS"
  type        = list(string)
}

variable "subnet_names" {
  description = "Name of Subnets"
  type        = list(string)
  default     = ["Public-Subnet-1", "Public-Subnet-2"]
}