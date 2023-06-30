variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "pubsub1_cidr_block" {
  default = "10.0.0.0/24"
}

variable "pubsub2_cidr_block" {
  default = "10.0.1.0/24"
}


variable "privsub1_cidr_block" {
  default = "10.0.2.0/24"
}

variable "privsub2_cidr_block" {
  default = "10.0.3.0/24"
}
