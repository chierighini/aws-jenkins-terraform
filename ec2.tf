resource "aws_instance" "jenkins-instance" {
  ami                         = "ami-0f72d3c899140e51a"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["${aws_security_group.sg_allow_ssh_jenkins.id}"]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  user_data                   = file(".terraform/modules/jenkins/install_jenkins.sh")

  tags = {
    Name = "Jenkins-Instance"
  }
}
