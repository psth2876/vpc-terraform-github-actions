resource "aws_lb" "alb" {
  name               = "my-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnet_id

  tags = {
    Environment = "production"
  }
}

# Listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}


# Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  count            = length(var.instances_id)
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instances_id[count.index]
  port             = 80
}