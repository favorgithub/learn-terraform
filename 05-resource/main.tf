resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_ami" "example" {
   owners = ["973714476881"]
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"

 }


## Resource block is the block that is used to actually create the resources, if you want to create a resource then you use a resource block
## You can get all the resources directly from the registry
## google create EC2 instnace terraform and the documentation will come
## or visit registry.io.terraform --> documentation--> EC2 Instance
## In order to launch an instance, it requires a AMI id and the AMI id we get from the data source
## you can create a github repo using terraform, just google github terraform provider and go to documentation
## For every resource, you will find the argument which is the input and the attribute which is output you get
## If you have group of resources that is where module will come into picture which we will look next

