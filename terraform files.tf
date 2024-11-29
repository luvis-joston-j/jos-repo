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

