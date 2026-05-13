resource "aws_instance" "example" {
  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t3.micro"
  vpc_security_group_ids= [aws_security_group.instance.id]

user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.xhtml
  nohup busybox httpd -f -p 8080 &
EOF

user_data_replace_on_change = true

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_security_group" "instance" {
name = "terraform-example-instance"
ingress {
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}
