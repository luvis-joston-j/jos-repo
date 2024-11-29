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
