resource "tls_private_key" "sed_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "sed" {
  key_name   = "sed_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDK9W6BFGj3lj1l5uIJdL9ONDIgJbJCsdiH9h7u/Gqrc/WPMNebcCMq5xqPuBH2EC3IKeEG1Ky+siGLSuV5I6zlhaH2OANv4TYPO7rNpJLJUO+I0Jm941t+NukErqof4KdK3RW+Qfgb+4IN9KUGkpn6P7pYqlfXJPSzYaSi1Y7QkbRqDrF5qlOVlETi8snI+J46BWeBx7Svqzfv/sQ4sSAIeDI65oB6AihZfT5ijPno1LqjSFwBIQFQk+deRj+RCwKpV5Eq8U6zPYTt4kOqrIsPC66mhP1TiGNP9jmkEeBpXeXqxmhlt1yQBd+EqR5noi17YAp6tPpWoOh35+x+gw9x ubuntu@ip-172-31-18-147"
}


resource "aws_security_group" "sed_sg" {
  name        = "sed_sg"
  description = "Allow tls inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "tls from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Tls from VPC"
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
  tags = {
    Name = "allow_tls"
  }
}