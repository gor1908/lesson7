terraform {
  required_providers {
    aws = {
      source  = "gor1908/lesson7"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "gor1908"
  region  = "eu-central-1"
}

resource "aws_instance" "lesson7" {
  ami           = "ami-03e0722760e96e886"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.SG_public_subnet.id]
  tags = {
    Name = "lesson7-instance"
  }
}


