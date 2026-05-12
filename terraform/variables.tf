variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "myapp"
}

variable "environment" {
  type    = string
  default = "dev"
}

#### VPC ####

variable "vpc_name" {
  type    = string
  default = "MyVPC"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "enable_nat_gateway" { type = bool }
variable "create_eip" { type = bool }

variable "create_app_sg" { type = bool }
variable "create_elb_sg" { type = bool }
variable "create_db_sg" { type = bool }

variable "db_port" { type = number }

variable "app_ingress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}

####      EC2     ####
variable "instance_name" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "enable_ssm" {
  type = bool
}
variable "enable_eip" {
  type = bool
}
variable "root_volume_size" {
  type = number
}
variable "root_volume_type" {
  type = string
}
variable "enable_volume_encryption" {
  type = bool
}
variable "enable_detailed_monitoring" {
  type = bool
}
