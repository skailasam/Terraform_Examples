resource "aws_instance" "TMCloud-example" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"
	availability_zone = "eu-west-1a"
	key_name = "${aws_key_pair.customkey.key_name}"
	root_block_device {
		volume_size = 10
		volume_type = "gp2"
		delete_on_termination = true
	}
	tags {
		Name = "Terraform EC2"
	}
	user_data = "#!/bin/bash\napt-get update\napt-get install apache2 -y"
}

resource "aws_ebs_volume" "ebs-volume-1" {
	availability_zone = "eu-west-1a"
	size = 20
	type = "gp2"
	tags {
		Name = "extra volume"
	}
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
	device_name = "/dev/xvdh"
	volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
	instance_id = "${aws_instance.TMCloud-example.id}"
}