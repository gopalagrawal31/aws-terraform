resource "aws_instance infra" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.dev-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.dev-region-key-pair.id}"

    provisioner "file" {
        source = "setup.sh"
        destination = "/tmp/setup.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/setup.sh",
             "sudo /tmp/setup.sh"
        ]
    }

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    
}

resource "aws_instance web" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.dev-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.dev-region-key-pair.id}

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}

resource "aws_key_pair" "dev-region-key-pair" {
    key_name = "dev-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
