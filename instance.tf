resource "aws_instance" "webec2" {
    ami = "ami-062df10d14676e201"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "newkey"
    vpc_security_group_ids = [ aws_security_group.myrsgroup.id]
    subnet_id = aws_subnet.my_subnet.id
    tags = {
      "Name" = "test"
    }
}