
#vpc
resource "aws_vpc" "TMCloud-VPC" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	tags {
		Name = "TMCloud-VPC"
	}
}

#subnets
resource "aws_subnet" "TMCloud-public-1" {
	vpc_id = "${aws_vpc.TMCloud-VPC.id}"
	cidr_block = "10.0.0.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-1a"
	
	tags {
		Name = "TMCloud-public-1"
	}
}	

#Internet Gateway
resource "aws_internet_gateway" "TMCloud-gw" {
	vpc_id = "${aws_vpc.TMCloud-VPC.id}"
	
	tags {
		Name = "TMCloud-GW"
	}
}

#routing table public
resource "aws_route_table" "TMCloud-rt-public"{
	vpc_id = "${aws_vpc.TMCloud-VPC.id}"
	route{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.TMCloud-gw.id}"
	}
	
	tags {
		Name = "TMCloud-rt-public"
	}
}

#route table assiciation
resource "aws_route_table_association" "TMCloud-public-1" {
	subnet_id = "${aws_subnet.TMCloud-public-1.id}"
	route_table_id = "${aws_route_table.TMCloud-rt-public.id}"
}
