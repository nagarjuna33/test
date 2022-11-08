resource "aws_security_group" "myrsgroup" {
  name        = "myresourcegroup"
vpc_id        = aws_vpc.myvpc.id

  ingress {
    description      = "myVPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.myvpc.cidr_block]
  }


  ingress {
    description      = "myVPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.myvpc.cidr_block]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "myresourcegrouptag"
  }
}