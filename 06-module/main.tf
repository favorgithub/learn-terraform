## If you have group of resources that is where module will come into picture which we will look next
## We want to create a server, one security group and the security group should be given to the server
## We will create a security group and the security group will be given to an ec2 instance
## With module we will create 2 resources but we can create n number of resources for a module
##Module is very important in terraform because everything is a module in terraform

## Here instead of writing the config for creating the for example dev aws instance from scratch or copy and past code
#we can use a module block to use the code which is already inside  the AWS instance directory

#To do this, we created this configuration file that contains a module block and in this module block,
#we provided the part to the local AWS instance directory which contains the actual terraform config to create the ec2 instance

## since this configuration directory where we will be running terraform commands is now the dev directory it becomes the root
# module and the AWS instance that we are calling from within our main.tf file is considered to be the child module

##For module syntax - we used the module keyword followed by the logical name of the module
#we have one required argument, which is the source this is the part where the child module is stored

####Personal Note##
## In this module block, we can provide the part of the local AWS instance directory which contains
#the actual terraform configuration to create the ec2 instance
## The module block below is  our root directory
## The directory where we have the module block is our root directory and we will provide the source directory
# child's directory where we have the ec2 instance which contains the actual ec2 configuration


module "ec2" {
  source = "./ec2"
}

output "public_ip_sample1" {
   value = module.sample1.public_ip

 }

 output "public_ip_sample2" {
    value = module.sample2.public_ip

  }