provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/VPC"

  project_name    = var.project_name
  environment     = var.environment
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs

  enable_nat_gateway = var.enable_nat_gateway
  create_eip         = var.create_eip

  create_app_sg = var.create_app_sg
  create_elb_sg = var.create_elb_sg
  create_db_sg  = var.create_db_sg

  app_ingress_rules = var.app_ingress_rules
}

###      EC2    ####

module "app_server" {
  source = "../../modules/EC2"

  project_name = var.project_name
  environment  = var.environment

  instance_name = var.instance_name
  ami_id        = var.ami_id
  instance_type = var.instance_type

  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.vpc.app_sg_id]

  # Secure access without SSH
  enable_ssm = var.enable_ssm

  # Optional static public access
  enable_eip = var.enable_eip

  # Storage configuration
  root_volume_size         = var.root_volume_size
  root_volume_type         = var.root_volume_type
  enable_volume_encryption = var.enable_volume_encryption

  # Monitoring
  enable_detailed_monitoring = var.enable_detailed_monitoring

  # Bootstrapping
  user_data = file("script.sh")

  tags = {
    Owner   = "DevOps-Team"
    Service = "SigNoz"
  }
}