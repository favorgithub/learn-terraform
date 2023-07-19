terraform {
  backend "s3" {
     bucket = "terraform-b73"
     key = "sample/terraform.tfstate"
     region = "us-east-1"


     }







}





##Terraform stores the state of the infrastructure that are created in the .tf files in the Terraform State File
##This state file allows Terraform to map real world resources to your configuration files.
##When we first ran terraform init on our initial first_ec2.tf file it created a state file within the folder.
##Terraform remote state
##
##
##
##
##
##
##
##