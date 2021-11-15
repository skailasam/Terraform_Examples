# Lookup the AMI id based on the region variable
resource "aws_instance" "TMCloud-example" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"	
}
