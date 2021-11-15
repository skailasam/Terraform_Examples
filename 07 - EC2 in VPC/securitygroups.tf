resource "aws_security_group" "allow-ssh" {
	vpc_id = "${aws_vpc.TMCloud-VPC.id}"
	name = "allow-ssh"
	description = "allow all ssh traffic"
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags{
		Name = "allow-ssh"
	}
}

resource "aws_security_group" "allow-http" {
	vpc_id = "${aws_vpc.TMCloud-VPC.id}"
	name = "allow-http"
	description = "allow all ssh traffic"
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags{
		Name = "allow-http"
	}
}