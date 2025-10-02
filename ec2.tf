# AMI Amazon Linux 2023 x86_64 kernel 6.1
data "aws_ami" "al2023" {
  owners      = ["137112412989"] # Amazon
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64*"]
  }
}

resource "aws_instance" "web" {
  count                       = 2
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.public_subnets[count.index]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data                   = file("my-site.sh") # просто чтобы было что проверять через ELB

  tags = merge(var.tags, {
    Name = "${var.project_name}-web-${count.index}"
    Role = "web"
  })
}
