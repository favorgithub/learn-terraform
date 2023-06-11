module "sample1" {
  source = "./ec2"
  name = "sample1"
}

module "sample2" {
  source = "./ec2"
  name = "sample2"
}




##root directory
##name equals sample1 is a variable input that will be called in the child directory