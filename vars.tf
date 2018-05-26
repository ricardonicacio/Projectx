variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "AMIS"{
  type = "map"
  default = {
   us-east-1 = "ami-6dfe5010"
   sa-east-1 = "ami-fd6c3e91"
   eu-west-1 = "ami-b29cb5cb"
  }
}