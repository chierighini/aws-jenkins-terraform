resource "aws_key_pair" "ssh-key-jenkins" {
  key_name   = "ssh-key-jenkins"
  public_key = var.jenkins-public-key
}

resource "aws_key_pair" "ssh-key-discord-bot" {
  key_name   = "ssh-key-discord-bot"
  public_key = var.jenkins-public-key
}
