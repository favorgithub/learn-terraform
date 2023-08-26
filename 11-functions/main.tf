variable "class" {
     default = "devops"

}

## Print the same in capital lettere
output "class" {
  value = upper(var.class)
}

variable "fruits" {
   default = ["apples", "mango", "oranges"]
}

  output "fruit_count" {
     value = length(var.fruits)
  }

  variable "classes" {
     default = {
        devops = {
           name = "devops"
           topics = ["jenkins", "docker"]

        }

        aws = {
         name = "aws"
        }

     }

  }

  output "devops_topics" {
    value = var.classes["devops"]["topics"]
  }

 output "aws_topics" {
    value = lookup(lookup(var.classes, "aws", null), "topics", "No Topics So far")
  }
