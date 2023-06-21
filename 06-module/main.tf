## If you have group of resources that is where module will come into picture which we will look next
## We want to create a server, one security group and the security group should be given to the server
## We will create a security group and the security group will be given to an ec2 instance
## With module we will create 2 resources but we can create n number of resources for a module
##Module is very important in terraform because everything is a module in terraform
## Here we created a module block that has a source ec2
## In this module block, we can provide the part of the local AWS instnce directory which contains
## the actual terraform configuration to create the ec2 instance


module "ec2" {
  source = "./ec2"
}



output "public_ip_sample1" {
   value = module.sample1.public_ip

 }

 output "public_ip_sample2" {
    value = module.sample2.public_ip

  }