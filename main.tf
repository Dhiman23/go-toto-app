resource "aws_security_group" "demo-web-sg" {
  name        = "websg"
  description = "this is for port exposing"
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
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

  tags = {
    Name = "websgg"
  }
}

resource "aws_instance" "server" {
  ami             = var.ami
  instance_type   = var.server
  security_groups = [aws_security_group.demo-web-sg.name]
  key_name = "server-key"
  user_data       = templatefile("./jenkins.sh", {})
  root_block_device {
    volume_size = 25
    volume_type = "gp3"
  }
  tags = {
    Name = "Master-Server"
  }

  associate_public_ip_address = true

}

