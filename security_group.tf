resource "aws_security_group" "test_sg" {
  vpc_id      = aws_vpc.test-vpc.id
  name        = "test-sg"
  description = "Security group for ssh"

  # Inbound traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}