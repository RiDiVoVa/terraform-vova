resource "aws_elb" "classic" {
  name                      = "${var.project_name}-classic-elb"
  security_groups           = [aws_security_group.elb_sg.id]
  subnets                   = module.vpc.public_subnets
  cross_zone_load_balancing = true
  idle_timeout              = 60

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }


  instances = aws_instance.web[*].id

  tags = merge(var.tags, { Name = "${var.project_name}-elb" })
}
