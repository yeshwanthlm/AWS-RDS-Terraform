variable "private_subnets" {
  type = map(any)
  default = {
    a = "10.0.4.0/24"
    b = "10.0.5.0/24"
  }
}

variable "subnets" {
  description = "Default values for public subnets."
  type        = map(any)
  default = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }
}

variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
}

variable "vpc_cidr" {
  description = "The network addressing for the default VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "amount_limitation" {
  type    = number
  default = 1000
}

variable "db_password" {
  description = "The password of the database"
  type        = string
  default     = "changeme123"
  sensitive   = true
}

variable "db_password_imported" {
  description = "The password of the database"
  type        = string
  default     = "changeme123"
  sensitive   = true
}

variable "db_port" {
  type    = string
  default = "5432"
}

variable "db_port_imported" {
  type      = string
  default   = "5432"
  sensitive = true
}

variable "ec2_amount_limitation" {
  type    = number
  default = 500
}

variable "ec2_threshold" {
  type    = number
  default = 400
}

variable "email" {
  type    = string
  default = "amonkincloud@gmail.com"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "instance_class_imported" {
  type    = string
  default = "db.t3.micro"
}

variable "s3_amount" {
  type    = number
  default = 100
}

variable "threshold" {
  type    = number
  default = 800
}

