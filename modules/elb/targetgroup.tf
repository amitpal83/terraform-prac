resource "aws_lb_target_group" "tg" {
  name     = var.tgname
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.env}-tg"
  }
}


resource "aws_lb_target_group_attachment" "demomodule_TargetGroup_ec2" {
  count            = var.env == "prod" ? 3 : 2
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.env == "prod" ? element(var.PrivateServers, count.index) : element(var.PublicServers, count.index)
  port             = 80
}

resource "aws_lb" "test" {
  name               = var.nlbname
  internal           = false
  load_balancer_type = "network"
  subnets            = var.Public_subnets
  security_groups    = [var.sg_id]

  enable_deletion_protection = false
  tags = {
    env = var.env
  }
}
