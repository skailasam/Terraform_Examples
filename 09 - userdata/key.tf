resource "aws_key_pair" "customkey" {
	key_name = "customkey"
	public_key = file(var.PATH_TO_PUBLIC_KEY)
}