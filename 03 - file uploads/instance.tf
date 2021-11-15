resource "aws_key_pair" "customkey" {
	key_name = "customkey"
	public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "TMCloud-example" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.customkey.key_name}"
	
	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
		
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo chmod +x /tmp/script.sh",
			"sudo sh /tmp/script.sh"
		]
	}
	connection {
		user = var.INSTANCE_USERNAME
		private_key = file(var.PATH_TO_PRIVATE_KEY)
		type     = "ssh"
		host 	= self.public_ip
	}
	
}

