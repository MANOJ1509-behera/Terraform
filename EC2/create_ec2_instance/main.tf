resource "aws_instance" "example" {
  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t3.micro"
  vpc_security_group_ids= [aws_security_group.instance.id]

user_data = <<-EOF
#!/bin/bash
cd /home/ec2-user
echo "Hello World" > index.html
nohup python3 -m http.server ${var.server_port} &
EOF

user_data_replace_on_change = true

  tags = {
    Name = "HelloWorld"
  }
}

variable "server_port"{
  description="Port number for the server"
  type=number
  default=8080
}


resource "aws_security_group" "instance" {
name = "terraform-example-instance"
ingress {
from_port = var.server_port
to_port = var.server_port
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}


output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
