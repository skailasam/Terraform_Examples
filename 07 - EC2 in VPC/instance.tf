resource "aws_instance" "TMCloud-Webserver" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.customkey.key_name}"
	
	subnet_id = "${aws_subnet.TMCloud-public-1.id}"
	
	vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}","${aws_security_group.allow-http.id}"]
	
	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
		
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo chmod +x /tmp/script.sh",
			"sudo sed -i 's/\r//' /tmp/script.sh",			//correct windows encoding of script file
			"sudo sh /tmp/script.sh"
		]
	}
	connection {
		user = var.INSTANCE_USERNAME
		private_key = file(var.PATH_TO_PRIVATE_KEY)
	}
}

