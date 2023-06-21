##Module is nothing but a group of resources
## Here we created a directory
## Here we created an ec2 local directory
## Here we have our resource block configuration file for security group and and an ec2 instance
## security group ec2 terraform
## We have to provide the security group ids in the ec2 resource block - check documentation -vpc_security group
## vpc_security_group_ids = resource type.resource name.id i.e aws_security_group.sg.id in square cos its a list
## name is sg means security group
## cidr_blocks - to whom you want to allow the port - 0.0.0.0/0 means to the outside world
## This configuration file will launch 1 instance and 1 security group

## Later we will try to create 2 sets of instances e.g. sample1 and sample2


resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "sample"
  }
}

data "aws_ami" "example" {
   owners = ["973714476881"]
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"

 }

 resource "aws_security_group" "sg" {
   name        = "sample"
   description = "Allow TLS inbound traffic"


   ingress {
     description      = "SSH"
     from_port        = 22
     to_port          = 22
     protocol         = "tcp"
     cidr_blocks      = ["0.0.0.0/0"]

   }

   egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
   }

   tags = {
     Name = "sample"
   }
 }