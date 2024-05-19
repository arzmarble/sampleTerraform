resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh_instance"
  public_key = file("ssh_instance.pub")
}

resource "aws_instance" "linux2-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc-pub-1.id
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  tags = {
    Name    = "Test-Linux2-Instance"
    Project = "Test"
  }

  # connection {
  #   user        = var.USER
  #   private_key = file("ssh_intsance")
  #   host        = self.public_ip
  # }
}

output "PublicIP-Linux2" {
  value = aws_instance.linux2-inst.public_ip
}

output "PrivateIP-Linux2" {
  value = aws_instance.linux2-inst.private_ip
}


# Ubuntu
resource "aws_instance" "ubuntu-inst" {
  ami                    = "ami-0cf2b4e024cdb6960"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc-pub-2.id
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  tags = {
    Name    = "Test-Ubuntu-Instance"
    Project = "Test"
  }

  # connection {
  #   user        = var.USER
  #   private_key = file("ssh_intsance")
  #   host        = self.public_ip
  # }
}

output "PublicIP-Ubuntu" {
  value = aws_instance.ubuntu-inst.public_ip
}

output "PrivateIP-Ubunu" {
  value = aws_instance.ubuntu-inst.private_ip
}