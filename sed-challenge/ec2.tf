resource "aws_instance" "sed_ec2" {
  ami             = "ami-026b57f3c383c2eec"
  instance_type   = "t2.micro"
  subnet_id       = "${aws_subnet.public-subnet-1.id}"
  key_name        = "sed_key"
  vpc_security_group_ids = [aws_security_group.sed_sg.id]
  user_data = file("script.sh")
  tags = {
  	name = "webserver"
  }
  }