variable "class" {
     default = "devops"

}

## Print the same in capital lettere
output "class" {
  value = upper(var.class)
}

variables "fruits"
  default = ["apples", "mango", "oranges"]

  output "fruit_count" {
     value = length(var.fruits)
  }
