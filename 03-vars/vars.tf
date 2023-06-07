variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello World"
}

output "sample" {
  value = var.sample
}

output "sample1" {
   value = var.sample1

}

output "sample-ext" {
  value = "value of sample - ${var.sample}"

}

## Plain Variable
variable "course" {
 default = "DevOps Training"
}

## List Variable
variable "courses" {
  default = [
   "DevOps",
   "AWS",
   "Python",
  ]

  }


## Map Variables
variable "course_details" {
  default = {
   DevOps = {
    name = "DevOps"
    timing = "10am"
    duration = 90
   }

   AWS = {
    name = "AWS"
    timimg = "11am"
    duration = 30
   }

   output "course" {
     value = var.course
   }


   output "courses" {
        value = var.courses
      }


   output "course details" {
     value = var.course_details
   }






