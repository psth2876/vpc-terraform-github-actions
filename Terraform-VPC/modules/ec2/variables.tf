variable "security_group_id" {
  description = "SG ID for EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = list(string)
}

variable "ec2_names" {
  description = "EC2 names"
  type        = list(string)
  default     = ["WebServer1", "WebServer2"]
}

variable "availability_zone_id" {
  
}