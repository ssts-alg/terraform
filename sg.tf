resource "aws_security_group" "allow_ssh" {
  name        = "allow_shh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.abc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["144.48.224.79/32", "10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
