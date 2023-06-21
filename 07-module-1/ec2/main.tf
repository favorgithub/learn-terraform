## We declared a variable as sample
## anywhere we had sample , we replaced by var.name
## In the ami we are calling the data source block i.e. data.aws_ami.example.id = resource type.resource name.id
## Here also we want to print the public ip addresses, then we use the output command
## syntax is resource type.resource name.public id


resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
  }
}

data "aws_ami" "example" {
   owners = ["973714476881"]
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"

 }

 resource "aws_security_group" "sg" {
   name        = var.name
   description = "Allow TLS inbound traffic"


   ingress {
     from_port        = 0
     to_port          = 0
     protocol         = "tcp"
     cidr_blocks      = ["0.0.0.0/0"]

   }

   egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
   }

   tags = {
     Name = var.name
   }
 }

 variable "name" {}


 ##child directory

 output "public_ip" {
   value = aws_instance.web.public_ip

 }