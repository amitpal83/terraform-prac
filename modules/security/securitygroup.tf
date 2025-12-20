resource "aws_security_group" "demomodulesg" {
  
  vpc_id      = var.vpc_id
  name        = "${var.vpc_name}-sg"
  description = "Security group for demo VPC"
  
    tags = {
        Name = "${var.vpc_name}-sg"
        env=var.env
    }

    dynamic "ingress" {
    for_each = local.ingress_rule1
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

   dynamic "ingress" {
    for_each = local.ingress_rule2
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
   }

   dynamic "ingress" {
    for_each = local.ingress_rule3
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
   }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}