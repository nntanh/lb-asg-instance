provider "aws" {
  region = "ap-southeast-1"
}

variable "instance_name" {
  type = string
  default = "live-test-instance"
}

variable "ami_id" {
  type = string
  default = "ami-082b1f4237bd816a1"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "key_name" {
  type = string
  default = "techiescamp"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-0dc3c4e13d30e5ceb"]
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-032985e267d24e016", "subnet-09190c5b7a232cd39", "subnet-092f01bbfd2aad145"]
}