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


 ## Here in our main.tf config file, we are creating an EC2 instance resource  and a security group to attach to the ec2
 #instance
 ## In the ami we are calling the data source block i.e. data.aws_ami.example.id = resource type.resource name.id
 ## Data sources allow data to be fetched or computed for use elsewhere in the Terraform configuration.
 ## Data sources allow terraform to read attributes from resources which are provisioned outside its control.
 ## Here also we want to print the public ip addresses, then we use the output command
 ## syntax is resource type.resource name.public id
 ## the output was not printing ....
 ## Everything in terraform is a module, where ever you are starting you code that is where
 ## you have your resource configuration file is reffered to as the root module
 ## From there you can call other module like the child module
 ## We declared a variable as sample
 ## anywhere we had sample , we replaced by var.name
 ##Child Module
 ##Data Source: aws_ami  (Use this data source to get the ID of a registered AMI for use in other resources.)