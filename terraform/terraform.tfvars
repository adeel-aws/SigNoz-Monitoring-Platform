aws_region   = "us-east-1"
project_name = "SigNoz"
environment  = "dev"
#### VPC ####
vpc_name        = "my-vpc"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs             = ["us-east-1a", "us-east-1b"]

enable_nat_gateway = false
create_eip         = false

create_app_sg = true
create_elb_sg = false
create_db_sg  = false

# db_port = 27017

app_ingress_rules = [
  {
    from_port   = 3301
    to_port     = 3301
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 4317
    to_port     = 4317
    protocol    = "tcp"
    cidr_blocks = ["52.201.227.119/32"]
  },
  {
    from_port   = 4318
    to_port     = 4318
    protocol    = "tcp"
    cidr_blocks = ["52.201.227.119/32"]
  }
]
#### ELB SG RULES (ONLY PUBLIC ENTRY POINT)
# elb_ingress_rules = [
#   {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   },
#   {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# ]


####   EC2   ####

instance_name              = "SigNoz"
instance_type              = "t3.large"
ami_id                     = "ami-0c7217cdde317cfec"
enable_eip                 = false
enable_ssm                 = true
root_volume_size           = 50
root_volume_type           = "gp3"
enable_volume_encryption   = true
enable_detailed_monitoring = true
