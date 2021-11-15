# Storing your credentials directly in the .tf file works by is NOT SECURE!
# When leaving the access_key empty, the credentials in the ~/.aws/credentials file are used
provider "aws" {
	access_key = ""
	secret_key = ""
	region = "eu-west-1"
	profile = "default"
}

# Multiple credentials can be configured in the ~/.aws/credentials file by using a profile
# provider "aws" {
# 	region = "eu-west-1"
# 	profile = "customprofile"
# }
#
# ~/.aws/credentials
# [customprofile]
# aws_access_key_id     = theaccesskey
# aws_secret_access_key = thesecret

# Create EC2 instance
# ami id is unique for a specific OS version and Region
# Instance Type is t2.nano
resource "aws_instance" "TMCloud-example-T2nano" {
	ami = "ami-0775b4648aabb6e6c"
	instance_type = "t2.nano"
}

# Create EC2 instance
# ami id is unique for a specific OS version and Region
# Instance Type is t2.micro
resource "aws_instance" "TMCloud-example2-T2micro" {
	ami = "ami-0775b4648aabb6e6c"
	instance_type = "t2.micro"
}