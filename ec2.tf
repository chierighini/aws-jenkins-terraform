resource "aws_instance" "jenkins-instance" {
  ami             = "${data.aws_ami.amazon-linux-2.id}"
  instance_type   = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_jenkins.id}"]
  subnet_id          = "${aws_subnet.main.id}"
  user_data = "${file("install_jenkins.sh")}"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
  }
  
  tags = {
    Name = "Jenkins-Instance"
  }
}