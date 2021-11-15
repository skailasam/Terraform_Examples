terraform {
	backend "s3" {
		bucket = "tmcloud"
		key = "terraform/TMCloud-project"
		region = "eu-west-1"
	}
}