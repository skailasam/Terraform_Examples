# Defining variables that can be used throughout all .tf files

# Simple variable with no default value
# Default values come from the terraform.tfvars file
# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}

# Simple variable with default value
variable "AWS_REGION"{ default = "eu-west-1" }

# Map variable
variable "AMIS"{
    default = {
		"us-east-1" = "ami-541d5f4d2"
		"us-west-1" = "ami-8784d98f7"
		"eu-west-1" = "ami-08c3796e1e14b07f8"
	}
}

# Do not add sensitive data to your code in plain text
# Without a default value, the value comes from a .tfvars file or from an environmental variable
variable "PASSWORD" {  
	description = "A password"  
	type        = string  
	sensitive   = true
}