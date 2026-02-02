variable "name" {
  type = string
}

variable "kube_version" {
  type    = string
  default = "1.30"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "max_capacity" {
  type = number
  default = 2
}

variable "min_capacity" {
  type = number
  default = 1
}

variable "instance_types" {
  type = list(string)
}