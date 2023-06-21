
module "sample1" {
  source = "./ec2"
  name = "sample1"
}

module "sample2" {
  source = "./ec2"
  name = "sample2"
}

output "public_ip_sample1"
 value = module.sample1.public.ip

output "public_ip_sample1"
 value = module.sample2.public.ip

## Here instead of writing the config for creating the for example dev aws instance from scratch or copy and past code
#we can use a module block to use the code which is already inside  the AWS instance directory

#To do this, we created this configuration file that contains a module block and in this module block,
#we provided the part to the local AWS instance directory which contains the actual terraform config to create the ec2 instance

## since this configuration directory where we will be running terraform commands is now the dev directory it becomes the root
# module and the AWS instance that we are calling from within our main.tf file is considered to be the child module

##For module syntax -  we used the module keyword followed by the logical name of the module sample 1 and 2
#Inside the module block we have the required argument which is the source, this is the part where the source module is stored

