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
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
resource "aws_vpc" "joston" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "joston"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.joston.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.joston.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_route_table" "jos1" {
  vpc_id = aws_vpc.joston.id
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.jos1.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.jos1.id
}
resource "aws_internet_gateway" "gate" {
  depends_on = [aws_vpc.joston]
  vpc_id = aws_vpc.joston.id

  tags = {
    Name = "gate"
  }
}
resource "aws_nat_gateway" "example" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private.id
}
resource "aws_route" "jos" {
  route_table_id            = aws_route_table.jos1.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gate.id
}

variable "sec" {
type = list(number)
default = [22,443,80,1234,3000,8080,9090]
}

resource "aws_security_group" "assign1" {
   name = "assign1"
   vpc_id = aws_vpc.joston.id
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
 tags = {
    name = "assign1"
    }
}
resource "aws_instance" "luv" {
  subnet_id = aws_subnet.public.id
  ami           =  "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.assign1.id]
 tags = {
    name = "myec2"
}
}
#############################################################################################################################################
provider "aws" {
  region     = "us-east-1"
  access_key = 
  secret_key = 
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "joston_vpc"
  }
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change to your desired AZ
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"  # Change to your desired AZ
  map_public_ip_on_launch = true
  tags = {
    Name = "Private Subnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create a NAT Gateway EIP (Elastic IP)
resource "aws_eip" "my_nat_eip" {
  vpc = true
}

# Create a NAT Gateway in the public subnet
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "my_nat_gateway"
  }
}

# Create route tables for public and private subnets

# Route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate public route table with public subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Route table for the private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Associate private route table with private subnet
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_instance" "luv" {
  subnet_id = aws_subnet.private_subnet.id
  ami           =  "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name = "jos"
  tags = {
    Name = "myec2"
  }
}
resource "aws_instance" "luv2" {
  subnet_id = aws_subnet.public_subnet.id
  ami           =  "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name = "jos"
  tags = {
    Name = "myec2-1"
  }
}
