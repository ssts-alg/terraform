resource "aws_instance" "private_instance" {
  count                  = var.private_instance_count
  ami                    = var.ami_id[var.region_name]
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private.*.id[0]
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.private_instance_name
  }
}
