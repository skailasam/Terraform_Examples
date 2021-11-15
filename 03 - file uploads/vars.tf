variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION"{ default = "eu-west-1" }
variable "AMIS"{
    default = {
		"us-east-1" = "ami-541d5f4d2"
		"us-west-1" = "ami-8784d98f7"
		"eu-west-1" = "ami-0775b4648aabb6e6c"
	}
}
variable "PATH_TO_PRIVATE_KEY" { 
	default = "customkey.pem"
}
variable "PATH_TO_PUBLIC_KEY" { 
	default = "customkey.pub"
}
variable "INSTANCE_USERNAME" {
	default = "ubuntu"
}