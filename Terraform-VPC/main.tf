module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.sg.sg-id
  subnet_id         = module.vpc.subnet-ids
  availability_zone_id = module.vpc.availability_zone_id
  
}

module "alb" {
  source = "./modules/alb"
  sg_id = module.sg.sg-id
  subnet_id = module.vpc.subnet-ids
  vpc_id = module.vpc.vpc_id
  instances_id = module.ec2.instances
}