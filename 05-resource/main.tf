## Resource block is the block that is used to actually create the resources, if you want to create a resource then you use a resource block
## You can get all the resources directly from the registry
## google create EC2 instnace terraform and the documentation will come
## or visit registry.io.terraform --> documentation--> EC2 Instance
## In order to launch an instance, it requires a AMI id and the AMI id we get from the data source














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


 ##to create resources