resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-03b2bb1012271d590"]

  tags = {
    Name = "HelloWorld"
  }

  connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }

  provisioner "remote-exec" {
      inline = [
        "sudo labauto ansible",
        "ansible-pull -i localhost, -U https://github.com/favorgithub/roboshop-ansible main.yml -e env=dev -e role_name=frontend"
      ]
    }
}

data "aws_ami" "example" {
   owners = ["973714476881"]
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"

 }





 ##After launching the instance, you can connect to the instnace and run commands inside the instanc
 ## to connect to the instance, it requires a group id
 ##The remote-exec provisioner invokes a script on a remote resource after it is created.
 #his can be used to run a configuration management tool, bootstrap into a cluster, etc
 ##Local Exec:these allow us to invoke local executable after a resource is created
 #what this means is that a local-exec provisioner can run an executable (command) on the machine
 #that is applying the Terraform (local):
 ## where ever terraform is running and in that work station we will run some commands
 ## with provisioners, you can create an instance and connect to the instance and perform commands

##What is Provisioners

##file - Provisioners will hep in copying the file into the server that we just created
#Remote exec mean you can connect into the remote node and execute some commands inside the node
#Local exec, where ever your terraform is running in your workstation and in that workstation you can run some commands
#depends on your requirement you can use any of them
#In our example we will be doing a remote exec


## Here we are using remote-exec provisioners to provision and ec2 intance and inside the ec2 instance we can run an ansible playbook
#to create a frontend server
#The remote-exec provisioner requires a connection and supports both ssh and winrm. we added an ssh connection block




