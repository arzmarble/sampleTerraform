variable "REGION" {
  default = "us-west-2"
}

variable "ZONE1" {
  default = "us-west-2a"
}

variable "ZONE2" {
  default = "us-west-2b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-west-2 = "ami-01cd4de4363ab6ee8"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "MYIP" {
  # IP/32
  default = "124.120.118.154/32"
}