resource "aws_lb" "lb_sed" {
  name               = "sed-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sed_sg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}


resource "aws_lb_target_group" "alb_target_group" {
  name = "sed-lb-tg"
  target_type = "ip"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc.id
  
  health_check {
    enabled = true
    interval = 30
    path = "/"
    timeout = 5
    matcher = 200
    healthy_threshold = 5
    unhealthy_threshold = 2
    }
    
    lifecycle {
      create_before_destroy = true
    }
  }


resource "aws_lb_listener" "listener_sed" {
  load_balancer_arn = aws_lb.lb_sed.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.lb_sed.arn
  port = 443
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = aws_acm_certificate.acm_certificate.arn
  
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}