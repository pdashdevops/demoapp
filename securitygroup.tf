module "ssh_service_sg_private" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for Private Instances SG - Allow all incoming traffic from within VPC and all egress"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "private-service ports"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  egress_rules = ["all-all"]
}

module "ssh_service_sg_public" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for Bastion host SG - Allow self ip to ssh to bastion instance and allow all egress."
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
}
  
module "ssh_service_sg_public_web" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for Public Web SG - Allow incoming to port 80 from self IP and all egress."
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "public-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
}
