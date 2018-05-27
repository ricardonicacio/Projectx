#   Instance Public 1
resource "aws_instance" "public1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-public-1.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

#   Instance Public 2
resource "aws_instance" "public2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-public-2.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-public-2.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

#   Instance Public 3
resource "aws_instance" "public3" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-public-3.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-public-3.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

#   Instance Private 1
resource "aws_instance" "private1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-private-1.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-private-1.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

#   Instance Private 2
resource "aws_instance" "private2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-private-2.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-private-2.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

#   Instance Private 3
resource "aws_instance" "private3" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  aws_subnet    = "${aws_subnet.main-private-3.id}"

  # The VPC Subnet
  subnet_id = "${aws_subnet.main-private-3.id}"

  # The security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # The public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # User Data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

# Public 20gb volumes Instances
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.public1.id}"
}

resource "aws_ebs_volume" "ebs-volume-2" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-2.id}"
  instance_id = "${aws_instance.public2.id}"
}

resource "aws_ebs_volume" "ebs-volume-3" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-3-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-3.id}"
  instance_id = "${aws_instance.public3.id}"
}

# Private 20gb volumes Instances

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-4.id}"
  instance_id = "${aws_instance.private1.id}"
}

resource "aws_ebs_volume" "ebs-volume-2" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-5.id}"
  instance_id = "${aws_instance.private2.id}"
}

resource "aws_ebs_volume" "ebs-volume-3" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-3-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id   = "${aws_ebs_volume.ebs-volume-6.id}"
  instance_id = "${aws_instance.private3.id}"
}
