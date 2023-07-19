terraform {
  backend "s3" {
     bucket = "terraform-80"
     key = "sample/terraform.tfstate"
     region = "us-east-1"


     }

}

output "demo" {
  value = "Hello World"

}