variable "class" {
     default = "devops"

}

## Print the same in capital lettere
output "class" {
  value = upper(var.class)
}
