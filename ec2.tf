module "ec2_instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"

  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.micro"
  key_name               = "kepair"
  monitoring             = true
  vpc_security_group_ids = [module.ssh_service_sg_public.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project = "Assignment-Mod5"
  }
}

module "ec2_instance_jenkis" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkin"

  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.micro"
  key_name               = "kepair"
  monitoring             = true
  vpc_security_group_ids = [module.ssh_service_sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project = "Assignment-Mod5"
  }
}

module "ec2_instance_app" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "app"

  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.micro"
  key_name               = "kepair"
  monitoring             = true
  vpc_security_group_ids = [module.ssh_service_sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project = "Assignment-Mod5"
  }
}

