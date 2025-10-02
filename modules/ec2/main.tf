resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.ssh_public_key
}


resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_ids]
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "Terraform-Instance"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  
    private_key = var.ssh_private_key 
    host        = self.public_ip
  }
  
  provisioner "file" {
    source      = "${path.module}/app.py"  
    destination = "/home/ubuntu/app.py" 
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y", 
      "sudo apt-get install -y python3-pip",  
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
}