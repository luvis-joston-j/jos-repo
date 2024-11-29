provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}
##############################################################################
provider "aws" {
  region = "us-east-1"
  access_key = "AKI"
  secret_key = "MJ+"
}

resource "aws_instance" "myubu" {
  ami        = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  count = 2
  tags = {
    Name = "terraform2"
  }
}
################################################################################################
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myubu" {
  ami        = var.amiid
  instance_type = var.instancetype
  count = 4
  tags = {
    Name = "${var.env}>${count.index}"
  }
}
###########################################################################################################
variable "region" {
   default  = "us-east-1"
}

variable "access_key" {
   default = "Q"
}

variable "amiid" {
   default = "ami-0866a3c8686eaeeba"
}

variable "secret_key" {
 default = ""
}

variable "instancetype" {
 default = "t2.micro"
}

variable "env" {
 default = "Dev"
}
####################################################################################
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "sec" {
type = list(number)
default = [1234,67,89,2233,4444,8080,9090]
}

resource "aws_security_group" "assign1"{
   name = "assign1"
   dynamic "ingress" {
   for_each = var.sec
     iterator = port
    content{
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
          }
      }
}
#################################################################################################
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "ma" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub-1" {
  depends_on = [aws_vpc.ma]
  vpc_id     = aws_vpc.ma.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-1"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.ma.id
    tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-1.id
  route_table_id = aws_route_table.example.id
}
#####################################################################################################################
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "ma" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub-1" {
  depends_on = [aws_vpc.ma]
  vpc_id     = aws_vpc.ma.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-1"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.ma.id
    tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.ma]
  vpc_id = aws_vpc.ma.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route" "jos" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

variable "sec" {
type = list(number)
default = [1234,67,89,2233,4444,8080,9090]
}

resource "aws_security_group" "assign1"{
   name = "assign1"
   vpc_id = aws_vpc.ma.id
   dynamic "ingress" {
   for_each = var.sec
     iterator = port
    content{
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
          }
      }
    egress{
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
}
}

resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = tls_private_key.mykey.public_key_openssh

  provisioner "local-exec" {
  command = "echo '${tls_private_key.mykey.private_key_openssh}' > ./my_key.pem"

}

}
#################################################################################################################
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "ma" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub-1" {
  depends_on = [aws_vpc.ma]
  vpc_id     = aws_vpc.ma.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-1"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.ma.id
    tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.ma]
  vpc_id = aws_vpc.ma.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route" "jos" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

variable "sec" {
type = list(number)
default = [1234,67,89,2233,4444,8080,9090]
}

resource "aws_security_group" "assign1"{
   name = "assign1"
   vpc_id = aws_vpc.ma.id
   dynamic "ingress" {
   for_each = var.sec
     iterator = port
    content{
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
          }
      }
    egress{
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
}
}

resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = tls_private_key.mykey.public_key_openssh

  provisioner "local-exec" {
  command = "echo '${tls_private_key.mykey.private_key_openssh}' > ./my_key.pem"

}

}

resource "aws_instance" "myec2" {
  ami           = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
  key_name = "my_key"
  subnet_id = aws_subnet.sub-1.id
  security_groups = [aws_security_group.assign1.id]
  tags = {
    Name = "Terrafrom-EC2"
  }

provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = tls_private_key.mykey.private_key_pem
    host     = self.public_ip
}

inline = [
  "sudo yum install httpd -y",
  "sudo systemctl start httpd",
  "sudo systemctl enable httpd",
  "sudo yum install git -y"
]
}
}

output "vpc-id" {
 value = aws_vpc.ma.id
}

output "instance-id" {
 value = aws_instance.myec2.id
}
#############################################################################################################################
