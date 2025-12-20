resource "aws_instance" "publicec2module" {
  
  count= var.env == "dev" ? 2 : 1
  
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_id, count.index)
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = "${var.vpc_name}-public-ec2"
    env  = var.env
  }
  
   associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
service nginx start
echo "*************************************************************" 
echo "<h1><center>Web-Server</center></h1>" >> /var/www/html/index.nginx-debian.html
echo "<h1><center>${var.vpc_name}-webserver-${count.index + 1}</center></h1>" >> /var/www/html/index.nginx-debian.html
EOF
}

