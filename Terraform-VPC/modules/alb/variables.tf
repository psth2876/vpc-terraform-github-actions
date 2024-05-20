variable "sg_id" {
  description = "SG ID for Application Load Balancer"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "instances_id" {
  description = "Instance ID for Target Group Attachments"
  type        = list(string)
}