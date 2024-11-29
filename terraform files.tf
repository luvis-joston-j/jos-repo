provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}
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
