# Creating a new security group for WP
resource "aws_security_group" "SG_public_subnet" {
  name        = "lesson7_security_group"
  description = "Allow SSH and HTTP"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.lesson7_host.id]
  }

 ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating security group for wordpress host
resource "aws_security_group" "lesson7" {
  name        = "lesson7"
  description = "Allow SSH"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating a new security group for RDS 
resource "aws_security_group" "SG_private_subnet_" {
  name        = "MYSQL_security_group"
  description = "Security group for wp_dataBase"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "MYSQL Port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.SG_public_subnet.id, aws_security_group.lesson7.id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
