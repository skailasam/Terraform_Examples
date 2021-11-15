resource "aws_instance" "TMCloud-example" {
	ami = lookup(var.AMIS,var.AWS_REGION)
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.TMCloud-public-1.id}"
	vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}","${aws_security_group.allow-http.id}"]
	key_name = "${aws_key_pair.customkey.key_name}"
	tags {
		Name = "Terraform EC2"
	}
	#user_data = "#!/bin/bash\napt-get update\napt-get install apache2 -y"
	user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
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
	device_name = var.INSTANCE_DEVICE_NAME
	volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
	instance_id = "${aws_instance.TMCloud-example.id}"
}