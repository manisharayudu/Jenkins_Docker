variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAVLPVWNIKFQF6FCHS"
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "eu-central-1"
}

variable "AMIS" {
    type = map
    default = {
        eu-north-1 = "ami-00a8ab5e0a29e8173"
        eu-south-1 = "ami-03f04e4a71e1b3c2b"
        eu-central-1 = "ami-0bdbe51a2e8070ff2"
        eu-west-1 = "ami-03caf24deed650e2c"
    }
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
