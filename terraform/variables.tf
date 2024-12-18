variable "key_name" {
  type = string
}

variable "public_key" {
  type = string
}

variable "private_key" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "db_identifier" {
  type    = string
  default = "wordpress-db-rds-connection-url"
}
