terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

user_data = <<-EOF
#!/bin/bash
apt update -y
apt install -y apache2

systemctl enable apache2
systemctl start apache2

echo "<!DOCTYPE html>
<html>
<head>
    <title>AWS Infrastructure Automation</title>
</head>
<body>
    <h1>AWS Infrastructure Automation Project</h1>

    <h2>Technologies Used</h2>
    <ul>
        <li>AWS</li>
        <li>Terraform</li>
        <li>Python</li>
        <li>PowerShell</li>
    </ul>

    <h2>Infrastructure Components</h2>
    <ul>
        <li>VPC</li>
        <li>Public Subnet</li>
        <li>Internet Gateway</li>
        <li>Security Group</li>
        <li>EC2 Instance</li>
    </ul>

    <p>Provisioned automatically using Terraform.</p>
</body>
</html>" > /var/www/html/index.html
EOF
}