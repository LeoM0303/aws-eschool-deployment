#Security Groups for Web Service
resource "aws_security_group" "web_sg" {
  name        = "eschool-web-sg-v3"
  description = "Allow SSH Application traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

#Security Group for Database
resource "aws_security_group" "db_sg" {
  name        = "eschool-db-sg-v3"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Java Web Service EC2 Instance
resource "aws_instance" "web_instance" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name = aws_key_pair.deployer.key_name

  tags = { Name = "eschool-web-instance" }
}

#MySQL EC2 Instance
resource "aws_instance" "db_instance" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name = aws_key_pair.deployer.key_name

  tags = { Name = "eschool-db-instance" }
}

#Generate SHH 
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Register public key with AWS
resource "aws_key_pair" "deployer" {
  key_name   = "eschool-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

#Save private key to local file
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/eschool-key.pem"
  file_permission = "0600"
}