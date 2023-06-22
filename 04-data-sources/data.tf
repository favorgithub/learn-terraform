
data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

data "aws_security_group" "selected" {
  name = "allow-all"
}

output "sgid" {
  value = data.aws_security_group.selected.id
 }

 data "aws_ami" "example" {
   owners = ["973714476881"]
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"

 }

 output "ami" {
   value = data.aws_ami.example.id
  }

  provider "aws" {
    region = "us-east-1"
  }




## Datasource is if you want to find out certain things that are already existing in your account in Amazon
## The authentication to amazon also comes into picture because it has to autenticate to amaazon and get the things
## Do a google search for the instance price terraform datasource to get the price of a particular instance
## Any resource in terraform you will see the argument and Attribute
## You have to look at the required argument and attribute
## Argument means the things that you need to provide .e.g the instance type, avaialabily zone, filter
## When the Argument is run, it expose some data and that data that it exposes is called attribute reference
## search google for "aws security group data source terraform" we know the name of the security group but we want the id
## you want to find out an existing information of amazon then you use datasource
## You can also use data source to find out the Ami id google "aws Ami id datasource terraform"
## executable user is amazon self means your own images
## Resource block is the block that is used to actually create the resources, if you want to create a resource then you use a resource block
## You can get all the resources directly from the registry
