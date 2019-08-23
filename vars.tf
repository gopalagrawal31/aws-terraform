variable "AWS_REGION" {    
    default = "ap-south-1a"
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
  default = {
    "ap-south-1a" = "ami-54d2a63b"
  }
}
