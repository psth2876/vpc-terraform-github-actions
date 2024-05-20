resource "aws_instance" "instance" {
  count                       = length(var.ec2_names)
  ami                         = "ami-0bb84b8ffd87024d8"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id[count.index]
  availability_zone = var.availability_zone_id
  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = var.ec2_names[count.index]
  }
}