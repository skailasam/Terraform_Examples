# Variables come from the vars.tf file
provider "aws" {
	# access_key = var.AWS_ACCESS_KEY
	# secret_key = var.AWS_SECRET_KEY
	region = var.AWS_REGION
}
