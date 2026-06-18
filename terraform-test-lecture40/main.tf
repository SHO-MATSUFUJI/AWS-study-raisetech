module "network" {
  source = "./modules/network"
}

module "compute" {
  source = "./modules/compute"

  vpc_id      = module.network.vpc_id
  ec2_subnet  = module.network.publicsubnet1a_id
  ec2_ami     = data.aws_ssm_parameter.latest_ami.value
  ec2_keypair = var.ec2_keypair
  my_pcip     = var.my_pcip
  alb_sg      = module.alb.alb_sg
}

module "alb" {
  source = "./modules/alb"

  vpc_id       = module.network.vpc_id
  ec2_instance = module.compute.ec2_instance
  public_1a    = module.network.publicsubnet1a_id
  public_1c    = module.network.publicsubnet1c_id
}

module "storage" {
  source = "./modules/storage"

  db_password = var.db_password
  private_1a  = module.network.privatesubnet1a_id
  private_1c  = module.network.privatesubnet1c_id
  vpc_id      = module.network.vpc_id
  ec2_sg      = module.compute.ec2_sg
}

module "security" {
  source = "./modules/security"

  alb_arn = module.alb.alb_arn
}

module "monitoring" {
  source = "./modules/monitoring"

  ec2_instance       = module.compute.ec2_instance
  period             = var.period
  evaluation_periods = var.evaluation_periods
  threshold          = var.threshold
  my_waf             = module.security.web_acl_arn
  email              = var.email
}

data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
