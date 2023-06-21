## In the output block we are calling the module as value module below
## module.sample1.public_ip = resource type.resource name.public ip




module "sample1" {
  source = "./ec2"
  name = "sample1"
}

module "sample2" {
  source = "./ec2"
  name = "sample2"
}

output "public_ip_sample1" {
   value = module.sample1.public_ip

 }

 output "public_ip_sample2" {
    value = module.sample2.public_ip

  }





##root directory
##name equals sample1 is a variable input that will be called in the child directory
## In terraform, wherever you are staring your code si referred to as root module
## from there you call some other module
##07 -module directory is a root module