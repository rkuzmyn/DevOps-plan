#----------------------------------------------------------
# DevOps-plan
#
# Create:
#   - #aws_instance jenkins-master
#   - #Auto Scaling Group using 2 Availability Zones
#
# Made by Roman Kuzmyn
#
#
#----------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}
module "aws_network" {
#   count         = 5
    source        = "./aws_network"
#    some_variable = some_value
}

##############for outputs################
#data "aws_availability_zones" "working" {}
#data "aws_caller_identity" "current" {}
#data "aws_region" "current" {}
#data "aws_vpcs" "my_vpcs" {}

data "aws_availability_zones" "available" {}
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

##########################################

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.jenkins-master.id
}

resource "aws_instance" "jenkins-master" {
   # count                  = 3
    ami                    = data.aws_ami.latest_amazon_linux.id
    instance_type          = "t2.micro"
    key_name               = "${var.aws-key-name}"
    vpc_security_group_ids = [aws_security_group.jenkins.id] #додати в створену security_group
    # user_data              =  file ("install_jenkins.sh")
    tags                   = {
     Name                  = "jenkins-master"
     Owner                 = "Roman Kuzmyn"
     E-mail                = "kuzmyn1983@gmail.com"
     Location              = "UA"
     Company               = "SoftJourn"
     Project               = "DevOps-plan"
    }
 #  depends_on = [aws_instance.jenkins-master, aws_instance.jenkins-master] # залежить від ресурсів (створюється після них)
}
#################################################################################################################
resource "aws_security_group" "jenkins" {
  name = "Security Group for jenkins"
  description = "Security Group for jenkins"
/*   dynamic "ingress" {
    for_each = ["8080", "80"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
*/ 
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["91.232.177.254/32"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
      } 
  tags                   = {
     Name                  = "jenkins"
     Owner                 = "Roman Kuzmyn"
     E-mail                = "kuzmyn1983@gmail.com"
     Location              = "UA"
     Company               = "SoftJourn"
     Project               = "Lessons Terraform"
    }
}
