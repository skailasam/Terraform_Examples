resource "aws_key_pair" "customkey02" {
	key_name = "customkey02"
	public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "TMCloud-example" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.customkey02.key_name}"
	
	provisioner "local-exec" {
		command = "echo ${aws_instance.TMCloud-example.public_ip} > public_ip.txt"
	}
	
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

# Output the public ip address
output "ip" {
  value = aws_instance.TMCloud-example.public_ip
}


