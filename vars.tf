variable "AWS_REGION" {    
    default = "eu-west-2"
}
variable "PRIVATE_KEY_PATH" {
  default = "dev-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "dev-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ec2-user"
}

variable "AMI" {
    type = "map"

    default {
        eu-west-2 = "ami-7ad7c21e"
    }
}
